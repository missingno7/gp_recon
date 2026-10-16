extern void fn_circuit_ega_0743d(int, int);
extern int grp_aace91da(int, int, int, int, int, int);
int show_menu_wrapper_3952(int a, int b, int c, int d, int e, int f)
{
    int result;
    fn_circuit_ega_0743d(0x70, 0);
    result = grp_aace91da(a, b, c, d, e, f);
    fn_circuit_ega_0743d(0x70, 0x73c8);
    return result;
}
