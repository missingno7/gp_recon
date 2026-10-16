extern void far fn_cycles_tandy_103a4(void);
#pragma alloc_text(FN_CYCLES_CGA_10948_TANDY_TEXT, fn_cycles_tandy_103a4)

extern void far fn_cycles_cga_063c6(void);

void far fn_cycles_tandy_103a4(void)
{
    fn_cycles_cga_063c6();
}
