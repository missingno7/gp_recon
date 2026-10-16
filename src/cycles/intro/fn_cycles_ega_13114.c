extern void far fn_cycles_ega_13114(void);
#pragma alloc_text(FN_CYCLES_CGA_10948_EGA_TEXT, fn_cycles_ega_13114)

extern void far fn_cycles_cga_063c6(void);

void far fn_cycles_ega_13114(void)
{
    fn_cycles_cga_063c6();
}
