extern unsigned int g_0028a;
extern unsigned int g_096e4;
extern unsigned int g_09bd6;
extern int fn_circuit_ega_020be(void);
extern void grp_fadcab13(void);
int single_prepare_selection_1c10(void) {
    int value;
    g_096e4 = g_0028a;
    g_09bd6 = 0;
    value = fn_circuit_ega_020be();
    if (value == -1) grp_fadcab13();
    return value;
}
