extern int g_9966;
extern unsigned long g_9966_long;
extern int g_9968;
extern int g_996a;
extern int g_996c;
extern int g_996e;
extern unsigned long far grp_7d3b9038(int, int);
extern void far fn_cycles_cga_05ada(char far *);
extern char far tail_resource;

void far grp_ca7d59e7(int value);
#pragma alloc_text(CYCLES_SCROLL_SETUP_TEXT, grp_ca7d59e7)
void far grp_ca7d59e7(int value)
{
    struct { int rounded; long scaled; } temp;
    if (g_9966 | g_9968)
        return;
    temp.scaled = (long)value * 4L;
    temp.rounded = (int)(temp.scaled >> 4) + 1;
    g_9966_long = grp_7d3b9038((int)&g_9966 - 8, temp.rounded);
    g_996a = value;
    g_996e = 0;
    g_996c = 0;
    fn_cycles_cga_05ada(&tail_resource);
}
