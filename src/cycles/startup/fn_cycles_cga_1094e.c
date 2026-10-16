extern int far fn_cycles_cga_1094e(long);
#pragma alloc_text(FN_CYCLES_CGA_10948_CGA_TEXT, fn_cycles_cga_1094e)

extern int far grp_3328fcba(long);
extern unsigned int g_0098;

int far fn_cycles_cga_1094e(long value)
{
    if (g_0098 != 0)
        return 0;
    return grp_3328fcba(value * 5L);
}
