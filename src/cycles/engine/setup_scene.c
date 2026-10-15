extern int g_b9ea;
extern int g_b9ec;
extern void far fn_cycles_cga_0763a(int, int);
extern void far grp_e76f1ca2(int);
extern void far fn_cycles_cga_09f14(int, int);
extern void far grp_fecf1db3(int, int);
extern void far fn_cycles_cga_06403(void);
extern void far fn_cycles_cga_072ee(long);
extern void far fn_cycles_cga_06412(void);
void far grp_944fa82f(void)
{
    fn_cycles_cga_0763a(g_b9ea, g_b9ec);
    grp_e76f1ca2(0);
    fn_cycles_cga_09f14(2, 0);
    grp_fecf1db3(0x81f, 0x58);
    fn_cycles_cga_06403();
    fn_cycles_cga_072ee(100L);
    fn_cycles_cga_06412();
}
