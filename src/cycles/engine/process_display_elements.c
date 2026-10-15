extern void far fn_cycles_cga_09f14(int, int);
extern void far grp_3be77d36(int, int, int, int);
extern int far grp_d33a06a1(int);
extern void far fn_cycles_cga_0c2b2(void);
extern int g_0024e;
int far grp_3f2832f6(void)
{
    struct { int i; int result; } local;
    fn_cycles_cga_09f14(3, 0);
    for (local.i = 0; local.i < g_0024e; ++local.i) {
        grp_3be77d36(0x74, local.i * 10 + 0x21, 0x371, 0xc8a0 + 0x46 * local.i);
    }
    local.result = grp_d33a06a1(1);
    fn_cycles_cga_0c2b2();
    return local.result;
}
