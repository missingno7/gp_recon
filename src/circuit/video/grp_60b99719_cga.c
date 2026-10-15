typedef unsigned int u16;
extern void fn_circuit_cga_0ab24(u16, u16);
extern void fn_circuit_cga_09b70(u16, u16, u16);
extern void grp_802d395c(long);
void grp_60b99719(u16 a, u16 b, u16 c, u16 d, u16 e, u16 f) {
    int i;
    for (i = 0; i < 5; ++i) {
        fn_circuit_cga_0ab24(d, f);
        fn_circuit_cga_09b70(a, b, c);
        grp_802d395c(4L);
        fn_circuit_cga_0ab24(e, f);
        fn_circuit_cga_09b70(a, b, c);
        grp_802d395c(4L);
    }
}
