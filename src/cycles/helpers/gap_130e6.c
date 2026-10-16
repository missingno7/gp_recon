extern unsigned g_cga_9108[];
extern void far fn_cycles_ega_07098(unsigned, unsigned);
void far fn_cycles_ega_130e6(void)
{
    int i;
    for (i = 0; i < 128; ++i)
        fn_cycles_ega_07098(0x0b30, g_cga_9108[i]);
}
