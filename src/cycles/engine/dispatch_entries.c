extern void far *grp_7d50ca88(int, int, int);
extern int grp_27ed9f4f(int, int);
extern void fn_cycles_cga_12596(void far *);
void grp_bb99f4e6(int first, int second)
{
    int index = 0;
    for (; index < grp_27ed9f4f(first, second); ++index)
        fn_cycles_cga_12596(grp_7d50ca88(first, second, index));
}
