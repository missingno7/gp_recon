typedef unsigned short U16;

extern U16 G_70E;
extern U16 g_cga_b7bc, g_cga_c86a;
extern U16 g_cga_0710, g_cga_0714, g_cga_0712;
extern U16 g_00716, g_00718;
extern U16 g_cga_071a, g_cga_071e, g_cga_071c;
extern U16 g_cga_0722, g_cga_0720, g_cga_0724, g_cga_0726;

void far cycles_reset_state(void);
#pragma alloc_text(CYCLES_STATE_INIT_TEXT, cycles_reset_state)

void far cycles_reset_state(void)
{
    G_70E = 0;
    g_cga_b7bc = 0;
    g_cga_c86a = 0;
    g_cga_0710 = 1;
    g_cga_0720 = g_cga_0722 = g_cga_071c = g_cga_071e = g_cga_071a =
        g_00718 = g_00716 = g_cga_0712 = g_cga_0714 = 0;
    g_cga_0724 = 0xffff;
    g_cga_0726 = 0xffff;
}
