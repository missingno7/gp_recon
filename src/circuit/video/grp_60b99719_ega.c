typedef unsigned int u16;
extern void fn_circuit_ega_08c84(u16, u16);
extern void fn_circuit_ega_0b9d2(u16, u16, u16);
extern void grp_802d395c(long);
void grp_60b99719(u16 a, u16 b, u16 c, u16 d, u16 e, u16 f) {
    int i;
    for (i = 0; i < 5; ++i) {
        fn_circuit_ega_08c84(d, f);
        fn_circuit_ega_0b9d2(a, b, c);
        grp_802d395c(4L);
        fn_circuit_ega_08c84(e, f);
        fn_circuit_ega_0b9d2(a, b, c);
        grp_802d395c(4L);
    }
}
