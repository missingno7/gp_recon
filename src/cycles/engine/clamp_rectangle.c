extern void far fn_cycles_cga_07ff5(int, int, int, int);
void far grp_d964a340(int x1, int y1, int x2, int y2)
{
    if (x1 < 0) x1 = 0;
    if (x1 > 320) x1 = 320;
    if (y1 < 0) y1 = 0;
    if (y1 > 200) y1 = 200;
    if (x2 < 0) x2 = 0;
    if (x2 > 320) x2 = 320;
    if (y2 < 0) y2 = 0;
    if (y2 > 200) y2 = 200;
    fn_cycles_cga_07ff5(x1, x2, y1, y2);
}
