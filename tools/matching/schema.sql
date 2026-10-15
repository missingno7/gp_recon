-- Small evidence/progress split for the Grand Prix matching atlas.
-- Oracle records are append-only; worker state and verification are mutable.
PRAGMA foreign_keys = ON;

CREATE TABLE IF NOT EXISTS binary_variant (
    variant_id TEXT PRIMARY KEY,
    game TEXT NOT NULL CHECK (game IN ('circuit','cycles')),
    label TEXT NOT NULL,
    provenance TEXT NOT NULL,
    packed_path TEXT,
    packed_sha256 TEXT,
    image_path TEXT,
    image_sha256 TEXT,
    image_size INTEGER CHECK (image_size IS NULL OR image_size >= 0),
    metadata_sha256 TEXT,
    relocation_count INTEGER CHECK (relocation_count IS NULL OR relocation_count >= 0),
    relocation_unique_count INTEGER CHECK (relocation_unique_count IS NULL OR relocation_unique_count >= 0),
    relocation_order_sha256 TEXT,
    relocation_multiset_sha256 TEXT,
    relocation_set_sha256 TEXT,
    variant_metadata_json TEXT NOT NULL DEFAULT '{}',
    canonical_oracle INTEGER NOT NULL DEFAULT 0 CHECK (canonical_oracle IN (0,1)),
    notes TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now')),
    CHECK ((packed_path IS NULL) = (packed_sha256 IS NULL)),
    CHECK ((image_path IS NULL) = (image_sha256 IS NULL))
);

CREATE TABLE IF NOT EXISTS binary_relocation (
    variant_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    ordinal INTEGER NOT NULL CHECK(ordinal >= 0),
    linear_offset INTEGER NOT NULL CHECK(linear_offset >= 0),
    PRIMARY KEY(variant_id,ordinal)
);
CREATE INDEX IF NOT EXISTS binary_relocation_value ON binary_relocation(variant_id,linear_offset,ordinal);

CREATE TABLE IF NOT EXISTS target (
    target_id TEXT PRIMARY KEY,
    game TEXT NOT NULL CHECK (game IN ('circuit','cycles')),
    video TEXT NOT NULL CHECK (video IN ('ega','cga','tandy')),
    oracle_variant_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    UNIQUE(game, video)
);
CREATE TRIGGER IF NOT EXISTS target_no_update BEFORE UPDATE ON target
BEGIN SELECT RAISE(ABORT,'canonical target oracle pins are immutable'); END;
CREATE TRIGGER IF NOT EXISTS target_no_delete BEFORE DELETE ON target
BEGIN SELECT RAISE(ABORT,'canonical target oracle pins are immutable'); END;

CREATE TABLE IF NOT EXISTS region (
    region_id TEXT PRIMARY KEY,
    target_id TEXT NOT NULL REFERENCES target(target_id),
    start_offset INTEGER NOT NULL CHECK(start_offset >= 0),
    end_offset INTEGER NOT NULL CHECK(end_offset > start_offset),
    kind TEXT NOT NULL DEFAULT 'unknown',
    label TEXT NOT NULL DEFAULT '',
    evidence TEXT NOT NULL DEFAULT '',
    UNIQUE(target_id, start_offset, end_offset)
);

CREATE TABLE IF NOT EXISTS function_item (
    function_id TEXT PRIMARY KEY,
    name TEXT NOT NULL,
    classification TEXT NOT NULL DEFAULT 'UNKNOWN' CHECK(classification IN (
      'SHARED_EXACT','SHARED_SOURCE_CANDIDATE','SHARED_SEMANTIC','SHARED_DIVERGED',
      'GAME_SPECIFIC','VIDEO_SPECIFIC','RUNTIME_LIBRARY','UNKNOWN')),
    confidence REAL CHECK(confidence IS NULL OR (confidence >= 0 AND confidence <= 1)),
    status TEXT NOT NULL DEFAULT 'unstarted',
    notes TEXT NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS function_target (
    function_id TEXT NOT NULL REFERENCES function_item(function_id),
    target_id TEXT NOT NULL REFERENCES target(target_id),
    region_id TEXT REFERENCES region(region_id),
    image_offset INTEGER NOT NULL CHECK(image_offset >= 0),
    byte_length INTEGER NOT NULL CHECK(byte_length > 0),
    PRIMARY KEY(function_id,target_id)
);
CREATE TRIGGER IF NOT EXISTS function_target_no_update BEFORE UPDATE ON function_target
BEGIN SELECT RAISE(ABORT,'function target ranges are immutable evidence'); END;
CREATE TRIGGER IF NOT EXISTS function_target_no_delete BEFORE DELETE ON function_target
BEGIN SELECT RAISE(ABORT,'function target ranges are immutable evidence'); END;

-- These are heuristic code candidates; boundary evidence does not promote them to
-- verified callable functions. One row is retained per binary variant and range.
CREATE TABLE IF NOT EXISTS function_candidate (
    candidate_id TEXT PRIMARY KEY,
    target_id TEXT NOT NULL,
    variant_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    image_start INTEGER NOT NULL CHECK(image_start >= 0),
    image_end INTEGER NOT NULL CHECK(image_end > image_start),
    boundary_status TEXT NOT NULL,
    boundary_confidence TEXT NOT NULL,
    classification TEXT NOT NULL DEFAULT 'UNKNOWN',
    runtime_attribution TEXT NOT NULL,
    decoded_instruction_count INTEGER NOT NULL CHECK(decoded_instruction_count >= 0),
    evidence_json TEXT NOT NULL,
    source_sha256 TEXT NOT NULL,
    FOREIGN KEY(target_id) REFERENCES target(target_id)
);

-- Pairwise byte regions stay separate from heuristic function candidates.
CREATE TABLE IF NOT EXISTS region_match (
    region_match_id TEXT PRIMARY KEY,
    variant_a_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    variant_b_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    start_a INTEGER NOT NULL CHECK(start_a >= 0),
    end_a INTEGER NOT NULL CHECK(end_a > start_a),
    start_b INTEGER NOT NULL CHECK(start_b >= 0),
    end_b INTEGER NOT NULL CHECK(end_b > start_b),
    match_type TEXT NOT NULL CHECK(match_type IN ('SHARED_EXACT','RELOCATION_MASKED')),
    matched_bytes_sha256 TEXT NOT NULL,
    confidence TEXT NOT NULL,
    classification TEXT NOT NULL,
    source_level_status TEXT NOT NULL,
    evidence_json TEXT NOT NULL,
    source_sha256 TEXT NOT NULL
);

-- Hand-curated/reported spans have their own table and never imply function boundaries.
CREATE TABLE IF NOT EXISTS known_region (
    known_region_id TEXT PRIMARY KEY,
    label TEXT NOT NULL,
    variant_a_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    start_a INTEGER NOT NULL CHECK(start_a >= 0),
    variant_b_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    start_b INTEGER NOT NULL CHECK(start_b >= 0),
    reported_size INTEGER NOT NULL CHECK(reported_size > 0),
    boundary_status TEXT NOT NULL,
    match_status TEXT NOT NULL,
    evidence_json TEXT NOT NULL,
    source_sha256 TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS census_pair (
    pair_id TEXT PRIMARY KEY,
    variant_a_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    variant_b_id TEXT NOT NULL REFERENCES binary_variant(variant_id),
    a_scope_end INTEGER NOT NULL CHECK(a_scope_end >= 0),
    b_scope_end INTEGER NOT NULL CHECK(b_scope_end >= 0),
    strict_exact_high_variation_bytes INTEGER NOT NULL CHECK(strict_exact_high_variation_bytes >= 0),
    strict_block_count INTEGER NOT NULL CHECK(strict_block_count >= 0),
    relocation_masked_high_variation_bytes INTEGER NOT NULL CHECK(relocation_masked_high_variation_bytes >= 0),
    relocation_masked_block_count INTEGER NOT NULL CHECK(relocation_masked_block_count >= 0),
    interpretation TEXT NOT NULL,
    evidence_json TEXT NOT NULL,
    source_sha256 TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS analysis_import (
    source_file TEXT NOT NULL,
    source_sha256 TEXT NOT NULL,
    row_count INTEGER NOT NULL CHECK(row_count >= 0),
    imported_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now')),
    PRIMARY KEY(source_file,source_sha256)
);

CREATE TABLE IF NOT EXISTS equivalence_group (
    group_id TEXT PRIMARY KEY,
    label TEXT NOT NULL,
    relation TEXT NOT NULL CHECK(relation IN ('SHARED_EXACT','SHARED_SOURCE_CANDIDATE',
      'SHARED_SEMANTIC','SHARED_DIVERGED','UNKNOWN')),
    confidence REAL CHECK(confidence IS NULL OR (confidence >= 0 AND confidence <= 1)),
    evidence TEXT NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS equivalence_member (
    group_id TEXT NOT NULL REFERENCES equivalence_group(group_id),
    function_id TEXT NOT NULL REFERENCES function_item(function_id),
    target_id TEXT NOT NULL REFERENCES target(target_id),
    PRIMARY KEY(group_id,function_id,target_id),
    FOREIGN KEY(function_id,target_id) REFERENCES function_target(function_id,target_id)
);

CREATE TABLE IF NOT EXISTS candidate (
    candidate_id TEXT PRIMARY KEY,
    function_id TEXT NOT NULL REFERENCES function_item(function_id),
    source_path TEXT NOT NULL,
    source_sha256 TEXT NOT NULL,
    revision TEXT NOT NULL DEFAULT '',
    worker TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now')),
    notes TEXT NOT NULL DEFAULT ''
);

CREATE TABLE IF NOT EXISTS candidate_output (
    candidate_id TEXT NOT NULL REFERENCES candidate(candidate_id),
    target_id TEXT NOT NULL,
    artifact_path TEXT NOT NULL,
    artifact_sha256 TEXT NOT NULL,
    PRIMARY KEY(candidate_id,target_id),
    FOREIGN KEY(candidate_id) REFERENCES candidate(candidate_id)
);

-- SQLite does not allow a subquery in a foreign key; candidate_output's function-target
-- membership is checked by the API before insertion. Keep this trigger as the SQL guard.
CREATE TRIGGER IF NOT EXISTS candidate_output_scope_insert
BEFORE INSERT ON candidate_output
BEGIN
  SELECT CASE WHEN EXISTS (
    SELECT 1 FROM promotion_receipt WHERE candidate_id=NEW.candidate_id
  ) THEN RAISE(ABORT,'candidate has already been submitted for promotion') END;
  SELECT CASE WHEN NOT EXISTS (
    SELECT 1 FROM candidate c JOIN function_target ft ON ft.function_id=c.function_id
    WHERE c.candidate_id=NEW.candidate_id AND ft.target_id=NEW.target_id
  ) THEN RAISE(ABORT,'candidate output target is outside function scope') END;
END;

CREATE TABLE IF NOT EXISTS dependency (
    function_id TEXT NOT NULL REFERENCES function_item(function_id),
    depends_on TEXT NOT NULL REFERENCES function_item(function_id),
    evidence TEXT NOT NULL DEFAULT '',
    PRIMARY KEY(function_id,depends_on),
    CHECK(function_id <> depends_on)
);

CREATE TABLE IF NOT EXISTS compiler_experiment (
    experiment_id TEXT PRIMARY KEY,
    target_id TEXT REFERENCES target(target_id),
    function_id TEXT REFERENCES function_item(function_id),
    compiler TEXT NOT NULL,
    version TEXT NOT NULL DEFAULT '',
    flags TEXT NOT NULL DEFAULT '',
    input_sha256 TEXT NOT NULL,
    output_path TEXT,
    output_sha256 TEXT,
    result TEXT NOT NULL CHECK(result IN ('pending','exact','different','failed','blocked')),
    details TEXT NOT NULL DEFAULT '',
    created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now'))
);

CREATE TABLE IF NOT EXISTS worker_lease (
    lease_id TEXT PRIMARY KEY,
    scope TEXT NOT NULL,
    owner TEXT NOT NULL,
    token TEXT NOT NULL UNIQUE,
    acquired_at TEXT NOT NULL,
    expires_at TEXT NOT NULL,
    state TEXT NOT NULL DEFAULT 'active' CHECK(state IN ('active','released','expired')),
    CHECK(expires_at > acquired_at)
);
CREATE INDEX IF NOT EXISTS worker_lease_scope_expiry ON worker_lease(scope,state,expires_at);

CREATE TABLE IF NOT EXISTS promotion_receipt (
    receipt_id TEXT PRIMARY KEY,
    candidate_id TEXT NOT NULL REFERENCES candidate(candidate_id),
    accepted INTEGER NOT NULL CHECK(accepted IN (0,1)),
    created_at TEXT NOT NULL DEFAULT (strftime('%Y-%m-%dT%H:%M:%fZ','now')),
    summary TEXT NOT NULL DEFAULT '',
    build_proof_json TEXT NOT NULL DEFAULT '{}'
);

CREATE TABLE IF NOT EXISTS target_verification (
    receipt_id TEXT NOT NULL REFERENCES promotion_receipt(receipt_id),
    function_id TEXT NOT NULL,
    target_id TEXT NOT NULL,
    oracle_sha256 TEXT NOT NULL,
    candidate_sha256 TEXT NOT NULL,
    byte_length INTEGER NOT NULL,
    exact INTEGER NOT NULL CHECK(exact IN (0,1)),
    regressed INTEGER NOT NULL CHECK(regressed IN (0,1)),
    gates_json TEXT NOT NULL DEFAULT '{}',
    oracle_relocation_entries INTEGER CHECK(oracle_relocation_entries IS NULL OR oracle_relocation_entries >= 0),
    oracle_relocation_unique INTEGER CHECK(oracle_relocation_unique IS NULL OR oracle_relocation_unique >= 0),
    oracle_relocation_order_sha256 TEXT,
    oracle_relocation_multiset_sha256 TEXT,
    oracle_relocation_set_sha256 TEXT,
    PRIMARY KEY(receipt_id,function_id,target_id),
    FOREIGN KEY(function_id,target_id) REFERENCES function_target(function_id,target_id)
);
CREATE INDEX IF NOT EXISTS target_verification_latest ON target_verification(function_id,target_id,receipt_id);

-- Hard fence against rewriting evidence after it has entered the atlas.
CREATE TRIGGER IF NOT EXISTS binary_variant_no_update BEFORE UPDATE ON binary_variant
BEGIN SELECT RAISE(ABORT,'binary_variant evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS binary_variant_no_delete BEFORE DELETE ON binary_variant
BEGIN SELECT RAISE(ABORT,'binary_variant evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS binary_relocation_no_update BEFORE UPDATE ON binary_relocation
BEGIN SELECT RAISE(ABORT,'binary relocation evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS binary_relocation_no_delete BEFORE DELETE ON binary_relocation
BEGIN SELECT RAISE(ABORT,'binary relocation evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS function_candidate_no_update BEFORE UPDATE ON function_candidate
BEGIN SELECT RAISE(ABORT,'function boundary evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS function_candidate_no_delete BEFORE DELETE ON function_candidate
BEGIN SELECT RAISE(ABORT,'function boundary evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS region_match_no_update BEFORE UPDATE ON region_match
BEGIN SELECT RAISE(ABORT,'byte region evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS region_match_no_delete BEFORE DELETE ON region_match
BEGIN SELECT RAISE(ABORT,'byte region evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS known_region_no_update BEFORE UPDATE ON known_region
BEGIN SELECT RAISE(ABORT,'known region evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS known_region_no_delete BEFORE DELETE ON known_region
BEGIN SELECT RAISE(ABORT,'known region evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS census_pair_no_update BEFORE UPDATE ON census_pair
BEGIN SELECT RAISE(ABORT,'census comparison evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS census_pair_no_delete BEFORE DELETE ON census_pair
BEGIN SELECT RAISE(ABORT,'census comparison evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS analysis_import_no_update BEFORE UPDATE ON analysis_import
BEGIN SELECT RAISE(ABORT,'analysis import record is immutable'); END;
CREATE TRIGGER IF NOT EXISTS analysis_import_no_delete BEFORE DELETE ON analysis_import
BEGIN SELECT RAISE(ABORT,'analysis import record is immutable'); END;
CREATE TRIGGER IF NOT EXISTS target_oracle_no_update BEFORE UPDATE ON target
BEGIN SELECT RAISE(ABORT,'target oracle pin is immutable'); END;
CREATE TRIGGER IF NOT EXISTS target_oracle_no_delete BEFORE DELETE ON target
BEGIN SELECT RAISE(ABORT,'target oracle pin is immutable'); END;
CREATE TRIGGER IF NOT EXISTS candidate_no_update BEFORE UPDATE ON candidate
BEGIN SELECT RAISE(ABORT,'candidate snapshot is immutable'); END;
CREATE TRIGGER IF NOT EXISTS candidate_no_delete BEFORE DELETE ON candidate
BEGIN SELECT RAISE(ABORT,'candidate snapshot is immutable'); END;
CREATE TRIGGER IF NOT EXISTS candidate_output_no_update BEFORE UPDATE ON candidate_output
BEGIN SELECT RAISE(ABORT,'candidate output snapshot is immutable'); END;
CREATE TRIGGER IF NOT EXISTS candidate_output_no_delete BEFORE DELETE ON candidate_output
BEGIN SELECT RAISE(ABORT,'candidate output snapshot is immutable'); END;
CREATE TRIGGER IF NOT EXISTS promotion_receipt_no_update BEFORE UPDATE ON promotion_receipt
BEGIN SELECT RAISE(ABORT,'promotion receipts are immutable'); END;
CREATE TRIGGER IF NOT EXISTS promotion_receipt_no_delete BEFORE DELETE ON promotion_receipt
BEGIN SELECT RAISE(ABORT,'promotion receipts are immutable'); END;
CREATE TRIGGER IF NOT EXISTS target_verification_no_update BEFORE UPDATE ON target_verification
BEGIN SELECT RAISE(ABORT,'verification evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS target_verification_no_delete BEFORE DELETE ON target_verification
BEGIN SELECT RAISE(ABORT,'verification evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS compiler_experiment_no_update BEFORE UPDATE ON compiler_experiment
BEGIN SELECT RAISE(ABORT,'compiler experiment evidence is immutable'); END;
CREATE TRIGGER IF NOT EXISTS compiler_experiment_no_delete BEFORE DELETE ON compiler_experiment
BEGIN SELECT RAISE(ABORT,'compiler experiment evidence is immutable'); END;
