// Ghidra postScript: export function candidates and direct call edges to ignored work.
import ghidra.app.script.GhidraScript;
import ghidra.program.model.listing.Function;
import ghidra.program.model.listing.FunctionIterator;
import ghidra.program.model.listing.Instruction;
import ghidra.program.model.listing.InstructionIterator;
import ghidra.program.model.symbol.Reference;
import ghidra.program.model.symbol.ReferenceIterator;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.TreeSet;

public class ghidra_inventory extends GhidraScript {
    private String csv(String value) {
        if (value == null) value = "";
        return "\"" + value.replace("\"", "\"\"") + "\"";
    }

    public void run() throws Exception {
        String[] args = getScriptArgs();
        String target = args[0];
        Path outDir = Paths.get(args[1]);
        Files.createDirectories(outDir);
        List<String> rows = new ArrayList<String>();
        rows.add("target,name,start_hex,end_exclusive_hex,span_size,body_bytes,instruction_count,is_thunk,is_external,calling_convention,signature,call_targets,caller_instructions,boundary_status,runtime_attribution");
        FunctionIterator functions = currentProgram.getFunctionManager().getFunctions(true);
        while (functions.hasNext()) {
            Function fn = functions.next();
            long start = fn.getBody().getMinAddress().getOffset();
            long end = fn.getBody().getMaxAddress().getOffset() + 1;
            TreeSet<Long> calls = new TreeSet<Long>();
            TreeSet<Long> callers = new TreeSet<Long>();
            int instructionCount = 0;
            InstructionIterator instructions = currentProgram.getListing().getInstructions(fn.getBody(), true);
            while (instructions.hasNext()) {
                Instruction instruction = instructions.next();
                instructionCount++;
                Reference[] outgoing = currentProgram.getReferenceManager().getReferencesFrom(instruction.getAddress());
                for (Reference ref : outgoing) {
                    if (ref.getReferenceType().isCall()) calls.add(ref.getToAddress().getOffset());
                }
                ReferenceIterator incoming = currentProgram.getReferenceManager().getReferencesTo(instruction.getAddress());
                while (incoming.hasNext()) {
                    Reference ref = incoming.next();
                    if (ref.getReferenceType().isCall()) callers.add(ref.getFromAddress().getOffset());
                }
            }
            rows.add(String.join(",", new String[] {
                csv(target), csv(fn.getName()), csv(String.format("0x%04X", start)),
                csv(String.format("0x%04X", end)), Long.toString(end - start),
                Long.toString(fn.getBody().getNumAddresses()), Integer.toString(instructionCount),
                Boolean.toString(fn.isThunk()), Boolean.toString(fn.isExternal()),
                csv(fn.getCallingConventionName()), csv(fn.getSignature().toString()),
                csv(calls.toString()), csv(callers.toString()),
                csv("Ghidra auto-analysis candidate; manually review"), csv("unproven")
            }));
        }
        Path output = outDir.resolve(target + "_functions.csv");
        Files.write(output, rows, StandardCharsets.UTF_8);
        println("Ghidra census exported " + (rows.size() - 1) + " function candidates to " + output);
    }
}
