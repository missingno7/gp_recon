extern unsigned long far * g_argument_words;
extern int g_00132;
extern int g_00134;
extern int g_00136;
extern int g_00138;
int far fn_cycles_cga_063c6(void);
void far fn_cycles_cga_08624(unsigned long, int);
void near fn_cycles_cga_0c276(void);
int far grp_d33a06a1(register int mode);
void far fn_cycles_cga_07ff5(int, int, int, int);
void far grp_d964a340(int x1, int y1, int x2, int y2);
void fn_cycles_cga_0c2ce(void);
void fn_cycles_cga_12316(int, int, int, char *);
int grp_bc055bb1(void);
void fn_cycles_cga_09f14(int, int);
void fn_cycles_cga_086da(int, int, int);
void grp_454837c8(int first, int second, int third, int fourth);
int far fn_cycles_cga_0555_1e10(int);
void grp_444f8b5b(int x, int y, int z);
void far fn_cycles_cga_08388();
void far fn_cycles_cga_11cf2();
void near fn_cycles_cga_11b0e();
void near fn_cycles_cga_11ac8();
void far grp_4940ac56(void);
void grp_e76f1ca2(int);
unsigned long grp_7a614cef(int, int, int);
void grp_9d44a3bf(unsigned long);
void fn_cycles_cga_0563e(unsigned long);
void fn_cycles_cga_10948(void);
void grp_efef7148(void);

int far grp_d33a06a1(register int mode)
{
    register int index;
    volatile int result;
    if (mode) {
        fn_cycles_cga_0c276();
    }
    index = 0;
    while (index < 4) {
        fn_cycles_cga_08624(*g_argument_words, index);
        if (mode != 2) {
            result = fn_cycles_cga_063c6();
            if (result != 0)
                return result;
        }
        ++index;
    }
    return 0;
}

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

int grp_bc055bb1(void)
{
    char work[0x24];
    int status;
    int anchor;
    fn_cycles_cga_0c2ce();
    fn_cycles_cga_12316(g_00132, g_00134, 0x154, work + 6);
    status = grp_d33a06a1(1);
    if (status)
        return status;
    grp_d964a340(0, 0x10, 0x60, 0x140);
    anchor = 0;
    return anchor;
}

void grp_454837c8(int first, int second, int third, int fourth)
{
    fn_cycles_cga_09f14(0, 0);
    fn_cycles_cga_086da(first, second, third);
    fn_cycles_cga_09f14(fourth, 0);
    fn_cycles_cga_086da(first, second - 1, third - 1);
}

void grp_444f8b5b(int x, int y, int z)
{
    int centered;
    centered = (0x0140 - fn_cycles_cga_0555_1e10(x)) / 2;
    grp_454837c8(x, centered, y, z);
}

void far grp_4940ac56(void)
{
    fn_cycles_cga_08388(0x10, 0, 0x120, 0x28, 0xaaaa);
    fn_cycles_cga_08388(0x10, 0x28, 0x120, 0x4e, 0xaaaa);
    fn_cycles_cga_11cf2(0x10, 0, 0x130, 0x76, 0xffff);
    fn_cycles_cga_11b0e(0x165, 6, 3);
    fn_cycles_cga_11ac8(0x173, 0x12, 0x32, 3);
    fn_cycles_cga_11ac8(0x17d, 0x9e, 0x32, 3);
    fn_cycles_cga_11ac8(0x18c, 0x14, 0x58, 3);
    fn_cycles_cga_11ac8(0x193, 0x9e, 0x58, 3);
    fn_cycles_cga_11b0e(0x1a6, 0x12, 3);
    fn_cycles_cga_11b0e(0x1c0, 0x1c, 3);
    fn_cycles_cga_11ac8(0x1cf, 0x24, 0x3e, 3);
    fn_cycles_cga_11ac8(0x1d9, 0x24, 0x48, 3);
    fn_cycles_cga_11ac8(0x1e6, 0xb0, 0x3e, 3);
    fn_cycles_cga_11ac8(0x1f0, 0xb0, 0x48, 3);
    fn_cycles_cga_11ac8(0x1fd, 0x24, 0x64, 3);
    fn_cycles_cga_11ac8(0x20b, 0x24, 0x6e, 3);
    fn_cycles_cga_11ac8(0x216, 0xb0, 0x64, 3);
    fn_cycles_cga_11ac8(0x224, 0xb0, 0x6e, 3);
}

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
