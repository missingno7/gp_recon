extern void far fn_cycles_cga_09f14(int, int);
extern void far fn_cycles_cga_08fc2(int, int, int);
extern void far fn_cycles_cga_05667(long);
void far grp_c3517998(int first, int second, int third, int fourth, int fifth, int sixth)
{
    int i;
    for (i = 0; i < 5; ++i) {
        fn_cycles_cga_09f14(fourth, sixth);
        fn_cycles_cga_08fc2(first, second, third);
        fn_cycles_cga_05667(4L);
        fn_cycles_cga_09f14(fifth, sixth);
        fn_cycles_cga_08fc2(first, second, third);
        fn_cycles_cga_05667(4L);
    }
}
