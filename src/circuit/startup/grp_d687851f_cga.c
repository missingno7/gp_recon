typedef int i16;
extern void grp_e76f1ca2(i16);
extern void fn_circuit_cga_0ab24(i16, i16);
extern void grp_622c4ed2(i16, i16);
extern void grp_921aa84f(long);
extern i16 fn_circuit_cga_020bc(void);
extern void grp_fadcab13(void);
extern void grp_c7e63dc5(void);
extern void fn_circuit_cga_0837e(void);
extern i16 g_096e4, g_09bd6, g_00298, g_012d8, g_00296, g_0004a;
i16 grp_d687851f(void) {
    i16 result;
    g_096e4 = 1;
    g_09bd6 = 0;
    grp_e76f1ca2(0);
    fn_circuit_cga_0ab24(3, 0);
    grp_622c4ed2(0x904c, 0x58);
    grp_921aa84f(120L);
    result = fn_circuit_cga_020bc();
    grp_e76f1ca2(0);
    if (result == -1) {
        grp_fadcab13();
        g_00298 = 0;
        g_00296 = g_012d8 << 1;
    }
    if (g_0004a == 0) {
        if (result == 0x1b)
            return 0x1b;
        grp_c7e63dc5();
        fn_circuit_cga_0837e();
        return result;
    }
    return 0x1b;
}
