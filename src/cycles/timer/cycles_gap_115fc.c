extern unsigned long g_cga_0712;
extern unsigned int g_cga_0710;
extern unsigned int g_cga_071a;
extern unsigned long g_cga_071c;
extern unsigned long g_cga_0720;
extern unsigned long g_cga_0724;
extern unsigned int G_70E;
extern unsigned int g_00716;
extern unsigned int g_cga_c86a;

void far fn_cycles_ega_115fc(void);
#pragma alloc_text(CYCLES_TIMER_UPDATE_TEXT, fn_cycles_ega_115fc)
void far fn_cycles_ega_115fc(void)
{
    g_cga_0720 += g_cga_0712 >> 4;
    if ((unsigned long)G_70E < g_cga_0724) {
        g_cga_071a = g_cga_0710;
        g_cga_0724 = G_70E;
        g_cga_071c = g_cga_0712;
    }
    g_00716 += G_70E;
    g_cga_0712 = 0L;
    G_70E = 0;
    g_cga_c86a = 100;
    ++g_cga_0710;
}
