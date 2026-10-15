extern void fn_cycles_cga_09f14(int, int);
extern void fn_cycles_cga_086da(int, int, int);
void grp_454837c8(int first, int second, int third, int fourth)
{
    fn_cycles_cga_09f14(0, 0);
    fn_cycles_cga_086da(first, second, third);
    fn_cycles_cga_09f14(fourth, 0);
    fn_cycles_cga_086da(first, second - 1, third - 1);
}
