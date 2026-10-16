extern unsigned g_cga_0b26;
extern int far grp_4b75cabe(int, int);
int far grp_4c82477a(int first, int second)
{
    if (second <= 0 && (second < 0 || first == 0))
        return g_cga_0b26;
    return grp_4b75cabe(first, second);
}
