extern int g_00438;
extern int g_0024e;
extern unsigned int g_c8e2[];

int far grp_f3f7c466(void)
{
    int index;
    int found;
    found = 0;
    index = 0;
    while (index < g_0024e) {
        if (g_c8e2[index * 35] & (g_00438 + 1))
            ++found;
        ++index;
    }
    return found;
}
