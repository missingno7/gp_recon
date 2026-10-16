typedef unsigned long U32;

extern U32 fn_circuit_ega_08bf2(void);

void fn_circuit_ega_08c5c(U32 interval)
{
    U32 deadline = fn_circuit_ega_08bf2() + interval;
    for (;;) {
        if (fn_circuit_ega_08bf2() >= deadline) {
            break;
        }
    }
}
