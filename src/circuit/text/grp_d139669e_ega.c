typedef unsigned int u16;
typedef unsigned long u32;
extern void fn_circuit_ega_08c84(u16, u16);
extern u16 fn_circuit_ega_056f0(u16);
extern void fn_circuit_ega_0b9d2(u16, u16, u16);
extern void grp_e23a5ac8(void);
extern u16 grp_64baada8(long);
extern u16 g_00290, g_05ec4, g_00296, g_0028e, g_098ea;
extern int g_09bd8;
void grp_d139669e(void) {
    fn_circuit_ega_08c84(0, 0x0c);
    fn_circuit_ega_0b9d2(fn_circuit_ega_056f0(g_00290), 0x38, 5);
    grp_e23a5ac8();
    fn_circuit_ega_0b9d2(fn_circuit_ega_056f0(g_05ec4), 0x18, 5);
    fn_circuit_ega_0b9d2(grp_64baada8((long)((u32)g_00296 + g_0028e)), 8, 0x0e);
    if (g_09bd8 <= 0) {
        fn_circuit_ega_0b9d2(grp_64baada8((long)(u32)g_0028e), 8, 0x16);
        g_098ea = g_0028e;
        return;
    }
    fn_circuit_ega_08c84(0x0f, 0x0c);
    fn_circuit_ega_0b9d2(grp_64baada8((long)(short)g_098ea), 8, 0x16);
}
