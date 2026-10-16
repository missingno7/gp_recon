typedef unsigned short u16;

extern u16 g_b9ea;
extern u16 g_b9ec;
extern u16 far *g_argument_words;
extern u16 g_0457a;
extern u16 g_0457c;

extern void far fn_cycles_cga_0763a(u16, u16);
extern void far grp_fdacd3b7(u16, u16);
extern void far grp_e76f1ca2(u16);
void far fn_cycles_ega_0ea4a(void);

void far fn_cycles_ega_0e9dc(void)
{
    fn_cycles_cga_0763a(g_b9ea, g_b9ec);
}

void far forward_pair_finalize(void)
{
    fn_cycles_cga_0763a(g_b9ea, g_b9ec);
    fn_cycles_ega_0ea4a();
}

void far fn_cycles_ega_0ea04(void)
{
    grp_fdacd3b7(g_argument_words[0], g_argument_words[1]);
}

void far fn_cycles_ega_0ea18(void)
{
    fn_cycles_ega_0e9dc();
    fn_cycles_ega_0ea04();
}

void far fn_cycles_ega_0ea22(void)
{
    fn_cycles_cga_0763a(g_0457a, g_0457c);
}

void far fn_cycles_ega_0ea34(void)
{
    fn_cycles_cga_0763a(g_0457a, g_0457c);
    fn_cycles_ega_0ea4a();
}

void far fn_cycles_ega_0ea4a(void)
{
    grp_e76f1ca2(0);
}
