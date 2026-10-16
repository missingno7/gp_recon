extern unsigned g_cga_0b58;
extern unsigned g_cga_0b56;
extern unsigned g_b7c6;
extern unsigned g_cga_2118;
extern unsigned g_cga_c87c;
extern unsigned g_cga_c896;
extern unsigned g_c86c;
void far fn_cycles_ega_13426(void);
void far fn_cycles_ega_13126(void)
{
    g_cga_0b58 = 0x20;
    g_cga_0b56 = 0;
    g_b7c6 = 0x9a;
    g_cga_2118 = 0;
    fn_cycles_ega_13426();
}
void far fn_cycles_ega_13426(void)
{
    g_cga_c87c = 0;
    g_cga_c896 = 0;
    g_c86c = 0;
}
