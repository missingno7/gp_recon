extern unsigned int g_096a0, g_096a2;
extern void grp_8fa8dedb(unsigned int);
extern void fn_circuit_ega_07040(unsigned int);
extern void grp_17077521(unsigned int, unsigned int, unsigned int);
void video_status_setup_3fa0(unsigned int parameter) {
    grp_8fa8dedb(0x2e9c);
    fn_circuit_ega_07040(0x878c);
    grp_17077521(g_096a0, g_096a2, parameter);
}

