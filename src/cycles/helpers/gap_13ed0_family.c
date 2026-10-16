extern void far FN_CYCLES_CGA_0767A(unsigned, unsigned, unsigned, unsigned);
extern void far FN_CYCLES_CGA_09316(unsigned, unsigned, unsigned, unsigned);

void far fn_cycles_ega_13ed0(unsigned a, unsigned b, unsigned c, unsigned d, unsigned e, unsigned f)
{
    FN_CYCLES_CGA_0767A(c, d, e, f);
    FN_CYCLES_CGA_09316(a, b, e, f);
}
void far fn_cycles_ega_13efe(unsigned a, unsigned b, unsigned c, unsigned d, unsigned e, unsigned f)
{
    FN_CYCLES_CGA_0767A(c, d, e, f);
    FN_CYCLES_CGA_09316(a, b, e, f);
}
void far fn_cycles_cga_11768(unsigned a, unsigned b, unsigned c, unsigned d, unsigned e, unsigned f)
{
    FN_CYCLES_CGA_0767A(c, d, e, f);
    FN_CYCLES_CGA_09316(a, b, e, f);
}
void far fn_cycles_cga_11796(unsigned a, unsigned b, unsigned c, unsigned d, unsigned e, unsigned f)
{
    FN_CYCLES_CGA_0767A(c, d, e, f);
    FN_CYCLES_CGA_09316(a, b, e, f);
}
void far fn_cycles_tandy_11160(unsigned a, unsigned b, unsigned c, unsigned d, unsigned e, unsigned f)
{
    FN_CYCLES_CGA_0767A(c, d, e, f);
    FN_CYCLES_CGA_09316(a, b, e, f);
}
void far fn_cycles_tandy_1118e(unsigned a, unsigned b, unsigned c, unsigned d, unsigned e, unsigned f)
{
    FN_CYCLES_CGA_0767A(c, d, e, f);
    FN_CYCLES_CGA_09316(a, b, e, f);
}
