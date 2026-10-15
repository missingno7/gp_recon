extern int g_00254;
extern int g_00438;
extern unsigned char g_b9fc[];
int grp_f53aee67(unsigned long key)
{
    int index = 0;
    for (; index < 4; index++) {
        if (*(unsigned long *)(g_b9fc + g_00254 * 216 + g_00438 * 72 + index * 18) > key)
            return index;
    }
    return -1;
}
