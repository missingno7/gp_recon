extern void far fn_cycles_cga_10948(void);
#pragma alloc_text(FN_CYCLES_CGA_10948_TANDY_TEXT, fn_cycles_cga_10948)

extern void far fn_cycles_tandy_055d6(void);

void far fn_cycles_cga_10948(void)
{
    fn_cycles_tandy_055d6();
}
