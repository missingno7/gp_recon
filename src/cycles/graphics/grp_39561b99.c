extern void far grp_39561b99(int, int);
#pragma alloc_text(GAP_7037B130_TEXT, grp_39561b99)
extern int far FN_CYCLES_CGA_05710(int, int, int, int, int);
extern int g_cga_0b8e[], g_45be, g_cga_0b6a[], g_cga_0b7c[];
extern unsigned char g_cga_0ba5[], g_cga_0ba4[];
extern int g_cga_0ba2, g_cga_0ba0;
struct gap_39561b99_locals { int row; int y; int x; };
void far grp_39561b99(int index, int y_delta)
{
    struct gap_39561b99_locals loc;
    loc.row = ((g_cga_0b8e[index] + g_45be) / 0xe0) << 1;
    if (loc.row < 0) loc.row = 0;
    loc.x = g_cga_0b6a[index] - 7;
    loc.y = g_cga_0b7c[index] - y_delta + 3;
    FN_CYCLES_CGA_05710(g_cga_0ba0 + loc.x, g_cga_0ba2 + loc.y, g_cga_0ba4[loc.row] + loc.x, g_cga_0ba5[loc.row] + loc.y, 0xff);
}
