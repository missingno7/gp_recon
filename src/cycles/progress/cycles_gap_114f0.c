typedef unsigned short U16;
typedef unsigned char U8;
typedef unsigned long U32;

extern U8 g_cga_b462, g_cga_b7e6;
extern U16 G_70E, g_00718;
extern U32 g_cga_0712;
extern int g_cga_c86a;
extern U16 g_cga_b7bc;

void far fn_cycles_ega_114f0(U16 amount);
#pragma alloc_text(ALLOC_TEXT, fn_cycles_ega_114f0)

void far fn_cycles_ega_114f0(U16 amount)
{
    if (g_cga_b462 != 0 && g_cga_b7e6 == 0) {
        g_cga_0712 += amount;
        if (amount > g_00718)
            g_00718 = amount;
        ++G_70E;
        if (--g_cga_c86a <= 0)
            g_cga_b7bc = G_70E;
    }
}
