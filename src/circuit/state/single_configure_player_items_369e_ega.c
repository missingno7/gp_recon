extern unsigned int g_098ec, g_098ee;
extern unsigned int g_098f0[];
extern int grp_0376aefe(int, int, int);
extern void grp_3cb306f6(unsigned int);
extern void grp_1a9a5e95(int, int, int, int);
extern void grp_2de0858f(int, int, int);
extern void fn_circuit_ega_0f28e(int);
void configure_player_items_369e(int parameter) {
    int value;
    int index;
    value = grp_0376aefe(parameter, 0x8102, 0x180);
    if (value <= 0) {
        grp_3cb306f6(0x9314);
        return;
    }
    grp_1a9a5e95(value, g_098ec, g_098ee, 0);
    for (index = 0; index < 8; ++index)
        grp_2de0858f(value, g_098f0[index], 0x12);
    fn_circuit_ega_0f28e(value);
}
