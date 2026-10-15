extern int g_0024e;
extern int g_00438;
extern unsigned short g_c8e2[];
int grp_464c8224(int requested)
{
    int index;
    int active;
    active = 0;
    index = 0;
    for (; index < g_0024e; ++index) {
        if (g_c8e2[index * 35] & (g_00438 + 1)) {
            if (active == requested)
                break;
            ++active;
        }
    }
    return index;
}
