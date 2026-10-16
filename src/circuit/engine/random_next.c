extern unsigned long g_cir_8de4;
extern unsigned long pascal grp_b6cba47c(unsigned long, unsigned long);

unsigned int fn_circuit_ega_0fcf6(void)
{
    g_cir_8de4 = grp_b6cba47c(0x343fdUL, g_cir_8de4) + 0x269ec3UL;
    return (unsigned int)((g_cir_8de4 >> 16) & 0x7fffUL);
}
