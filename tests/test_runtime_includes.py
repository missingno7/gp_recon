"""Pinned MASM include staging for reproducible startup builds."""
import hashlib
import json
from pathlib import Path
import tempfile
import unittest

from tools.matching import pipeline


class PinnedIncludeTests(unittest.TestCase):
    def test_staged_include_is_hashed_and_assembled(self):
        with tempfile.TemporaryDirectory(dir=pipeline.ROOT / 'work') as tmp:
            root = Path(tmp)
            (root / 'analysis').mkdir()
            source = root / 'source.asm'
            source.write_bytes(b"include RUNTIME.INC\n_TEXT SEGMENT WORD PUBLIC 'CODE'\nASSUME CS:_TEXT\n"
                               b'PUBLIC _leaf\n_leaf PROC NEAR\n ret\n_leaf ENDP\n_TEXT ENDS\nEND\n')
            include = root / 'RUNTIME.INC'
            include.write_bytes(b'; pinned test include\n')
            lock = json.loads((pipeline.ROOT / 'analysis/toolchain.json').read_text())
            lock['profiles']['test-runtime-include'] = {
                'kind': 'asm', 'tool': 'masm510', 'flags': [],
                'includes': [{'name': 'RUNTIME.INC', 'path': str(include),
                              'sha256': hashlib.sha256(include.read_bytes()).hexdigest()}],
            }
            (root / 'analysis/toolchain.json').write_text(json.dumps(lock))
            obj, report = pipeline.build(source, 'test-runtime-include', root)
            self.assertEqual('built', report['status'], report)
            self.assertEqual(include.read_bytes(), (Path(report['scratch']) / 'RUNTIME.INC').read_bytes())
            self.assertEqual(b'\xc3', pipeline.extract(obj, '_leaf', 1)[0])
            include.write_bytes(b'; changed\n')
            with self.assertRaisesRegex(ValueError, 'include file missing or hash changed'):
                pipeline.load_profile('test-runtime-include', root)

    def test_include_name_cannot_escape_scratch(self):
        with tempfile.TemporaryDirectory(dir=pipeline.ROOT / 'work') as tmp:
            root = Path(tmp)
            (root / 'analysis').mkdir()
            lock = json.loads((pipeline.ROOT / 'analysis/toolchain.json').read_text())
            lock['profiles']['bad-include'] = {
                'kind': 'asm', 'tool': 'masm510', 'flags': [],
                'includes': [{'name': '../BAD.INC', 'path': __file__, 'sha256': '0' * 64}],
            }
            (root / 'analysis/toolchain.json').write_text(json.dumps(lock))
            with self.assertRaisesRegex(ValueError, 'invalid or duplicate include name'):
                pipeline.load_profile('bad-include', root)
