extern void far fn_cycles_cga_10948(void);
#pragma alloc_text(FN_CYCLES_CGA_10948_EGA_TEXT, fn_cycles_cga_10948)

extern void far fn_cycles_ega_05722(void);

void far fn_cycles_cga_10948(void)
{
    fn_cycles_ega_05722();
}
