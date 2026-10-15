extern int g_00136;
extern int g_00138;
extern void grp_e76f1ca2(int);
extern unsigned long grp_7a614cef(int, int, int);
extern void grp_9d44a3bf(unsigned long);
extern void fn_cycles_cga_0563e(unsigned long);
extern void fn_cycles_cga_10948(void);
void grp_efef7148(void)
{
    char local_prefix[2];
    unsigned long resource;
    char local_tail[2];
    grp_e76f1ca2(0);
    resource = grp_7a614cef(g_00136, g_00138, 0x225);
    grp_9d44a3bf(resource);
    fn_cycles_cga_0563e(0xb4L);
    fn_cycles_cga_10948();
}
