struct CallbackTable {
    unsigned char reserved0[0x0c];
    void (far *step)(int);
    unsigned char reserved10[4];
    void (far *finish)(void);
};
void far *grp_7d50ca88(int, int, int);
extern struct CallbackTable far * g_08e6a;
extern int g_08e70;
extern int g_08e74;
extern int g_08e72;
extern int g_08e78;
extern int g_08e76;
extern int g_0a966[];
extern int g_9966;
extern unsigned long g_9966_long;
extern int g_9968;
extern int g_996a;
extern int g_996c;
extern int g_996e;
extern char far tail_resource;
extern int g_0996e;
extern int g_0996a;
extern int g_0996c;
extern long far * g_09966;
extern unsigned short g_9d50;
extern unsigned short g_9d52;
extern unsigned short g_9d4a;
extern unsigned short g_9d4c;
extern unsigned short g_438;
extern unsigned short g_724;
extern unsigned short g_726;
extern unsigned short g_a7a8;
void grp_8b72637a(void);
void grp_51debc93(void);
int grp_fb4d04d5(void);
int grp_27ed9f4f(int, int);
void fn_cycles_cga_12596(void far *);
void grp_bb99f4e6(int first, int second);
unsigned long far grp_7d3b9038(int, int);
void far fn_cycles_cga_05ada(char far *);
void far grp_ca7d59e7(int value);
void grp_15d06500(int a1, int a2, int a3, int a4, int a5, int a6, int a7, int a8, int a9, long value);
unsigned long far fn_cycles_cga_06a4e(void);
int far fn_cycles_cga_05fa8(void);
void far fn_cycles_cga_0af82(char *);
void far fn_cycles_cga_09f48(char *);
void far fn_cycles_cga_09f86(unsigned long);
unsigned long far fn_cycles_cga_09f92(int, int, int);
void far fn_cycles_cga_0763a(unsigned long);
void far fn_cycles_cga_09cd8(int, int, int, int, int, int);
void far fn_cycles_cga_07658(int, int, int, int);
void far fn_cycles_cga_056ef(int, int, int, int);
void far fn_cycles_cga_0803e(int);
void far fn_cycles_cga_09f14(int, int);
void far fn_cycles_cga_11cb8(int, int, unsigned long);
void far fn_cycles_cga_06e70(int, int, int, int, int);
int far fn_cycles_cga_061d0(void);
int far fn_cycles_cga_063cb(void);
int far fn_cycles_cga_05ffe(void);
int far fn_cycles_cga_05fee(int);
void far grp_d3aebb85(void);
void far fn_cycles_cga_07ff5(int, int, int, int, int);
void far fn_cycles_cga_05667(char far *);
void far fn_cycles_cga_08e60(unsigned long);
void far fn_cycles_cga_09f6a(char far *);
void far fn_cycles_cga_0afa2(char far *);
void far fn_cycles_cga_070ea(unsigned long);
void far grp_dd757961(int title, int subtitle, int option);

void grp_8b72637a(void)
{
    int total;
    int count;
    g_08e74 = 1;
    total = 0;
    if (g_08e70 >= 0) {
        count = g_08e70 + 1;
        total += count;
    }
    g_08e6a->step(total);
    g_08e6a->finish();
}

void grp_51debc93(void)
{
    register int i;
    g_08e78 = 0;
    for (i = 0x0c; g_08e72 >= i; ++i)
        g_08e6a->step(i);
    g_08e6a->finish();
}

int grp_fb4d04d5(void)
{
    register int near *scan;
    register int limit;
    int count;
    count = 0;
    if (g_08e70 < 0)
        return 1;
    scan = g_0a966;
    limit = g_08e70;
    do {
        if ((scan[0] | scan[1]) == 0) {
            return 0;
        }
        scan += 69;
        ++count;
    } while (count <= limit);
    return 1;
}

void grp_bb99f4e6(int first, int second)
{
    int index = 0;
    for (; index < grp_27ed9f4f(first, second); ++index)
        fn_cycles_cga_12596(grp_7d50ca88(first, second, index));
}

void far grp_ca7d59e7(int value)
{
    struct { int rounded; long scaled; } temp;
    if (g_9966 | g_9968)
        return;
    temp.scaled = (long)value * 4L;
    temp.rounded = (int)(temp.scaled >> 4) + 1;
    g_9966_long = grp_7d3b9038(0x995e, temp.rounded);
    g_996a = value;
    g_996e = 0;
    g_996c = 0;
    fn_cycles_cga_05ada(&tail_resource);
}

void grp_15d06500(int a1, int a2, int a3, int a4, int a5, int a6,
                  int a7, int a8, int a9, long value)
{
    char frame_slot[2];
    if (g_0996e == 1 && g_0996c < g_0996a)
        g_09966[g_0996c++] = value;
}

void far grp_d3aebb85(void)
{
    char top[52], bottom[24];
    unsigned long screen;
    int previous, key, i;
    if (fn_cycles_cga_06a4e() < 1000) {
        g_9d50 = 0; g_9d52 = 0;
        fn_cycles_cga_06e70(0,0,0,0,0);
        return;
    }
    g_9d52 = 1;
    if (fn_cycles_cga_05fa8() & 0x10) {
        fn_cycles_cga_06e70(0,0,0,0,0);
        return;
    }
    fn_cycles_cga_0af82(top);
    fn_cycles_cga_09f48(bottom);
    fn_cycles_cga_09f86(0x12e30000UL);
    screen = fn_cycles_cga_09f92(0x140, 0xc8, 0xf);
    fn_cycles_cga_0763a(screen);
    fn_cycles_cga_09cd8(0, 0, 0, 0, 0, 0xc8);
    fn_cycles_cga_07658(0, 0, 0, 0x140, 0xc8);
    fn_cycles_cga_056ef(0, 0, 0x482e, 0xc8);
    fn_cycles_cga_0803e(0);
    fn_cycles_cga_09f14(0, 1);
    fn_cycles_cga_11cb8(0x9cc2, 0x23, 0);
    fn_cycles_cga_11cb8(0x9ce8, 0x2d, 0);
    fn_cycles_cga_11cb8(0x9d12, 0x37, 0);
    fn_cycles_cga_11cb8(0x9d2a, 0xb9, 0);
    fn_cycles_cga_06e70(0xffff,0x82,0x46,0x82,0xa0);
    fn_cycles_cga_06e70(0xffff,0xaa,0x46,0xaa,0xa0);
    fn_cycles_cga_06e70(0xffff,0x5a,0x64,0xd2,0x64);
    fn_cycles_cga_06e70(0xffff,0x5a,0x82,0xd2,0x82);
    previous = -1;
    fn_cycles_cga_061d0();
    for (;;) {
        key = fn_cycles_cga_063cb();
        if (key) {
            fn_cycles_cga_0763a(screen);
            fn_cycles_cga_09f86(screen);
            fn_cycles_cga_09f48(bottom);
            fn_cycles_cga_0af82(top);
            fn_cycles_cga_05ffe(4);
            fn_cycles_cga_06e70(0,0,0,0,0);
            break;
        }
        key = fn_cycles_cga_05ffe(0);
        if (key == previous) continue;
        previous = key;
        for (i = 0; i < 9; ++i) fn_cycles_cga_056ef(0,0x20,0x18,i,0);
        fn_cycles_cga_056ef(0xaaaa,0x20,0x18,key,0);
    }
}

void far grp_dd757961(int title, int subtitle, int option)
{
    unsigned long surface;
    char screen[52];
    char line[24];
    surface = fn_cycles_cga_09f92(0x140, 0xa, 0xf);
    fn_cycles_cga_0af82(screen);
    fn_cycles_cga_09f48(line);
    fn_cycles_cga_09f86(0x12e30000UL);
    fn_cycles_cga_0763a(surface);
    fn_cycles_cga_09cd8(0, 0xbe, 0, 0, 0, 0x140);
    fn_cycles_cga_07658(0, 0, 0x140, 0xc8);
    fn_cycles_cga_07ff5(0, 0, 0xbe, 0, 0x140);
    fn_cycles_cga_09f14(0, 1);
    fn_cycles_cga_11cb8(option, 0xbf, 0L);
    fn_cycles_cga_05667(title);
    fn_cycles_cga_09f6a(subtitle);
    fn_cycles_cga_070ea(surface);
}
