extern unsigned g_cga_c87a;
extern unsigned g_cga_c76e;
extern unsigned g_cga_b7c4;
extern unsigned g_cga_b7e8;
extern unsigned g_cga_b7c2;
extern void far fn_cycles_ega_0de0c(unsigned, unsigned, unsigned);
extern void far fn_cycles_cga_0bca8(unsigned, unsigned, unsigned);
extern void far fn_cycles_tandy_0b6aa(unsigned, unsigned, unsigned);
void far fn_cycles_ega_148a0(void)
{
    if (g_cga_c87a != 0)
        fn_cycles_ega_0de0c((g_cga_b7e8 << 3) + g_cga_b7c2, g_cga_b7c4, g_cga_c76e);
}
void far fn_cycles_cga_12150(void)
{
    if (g_cga_c87a != 0)
        fn_cycles_cga_0bca8((g_cga_b7e8 << 3) + g_cga_b7c2, g_cga_b7c4, g_cga_c76e);
}
void far fn_cycles_tandy_11b48(void)
{
    if (g_cga_c87a != 0)
        fn_cycles_tandy_0b6aa((g_cga_b7e8 << 3) + g_cga_b7c2, g_cga_b7c4, g_cga_c76e);
}
