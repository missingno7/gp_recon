typedef unsigned long U32;

extern U32 g_cir_8b40;
extern U32 fn_circuit_ega_08bf2(void);

void fn_circuit_ega_08c1d(U32 delta)
{
    g_cir_8b40 = fn_circuit_ega_08bf2() + delta;
}
