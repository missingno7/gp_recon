extern unsigned int far *g_0457a;
extern unsigned int far *g_0457c;
extern unsigned int G_013A, G_013C;
extern unsigned int g_b9ea, g_b9ec;
extern void far fn_cycles_cga_0763a(unsigned int, unsigned int);
extern int far grp_e76f1ca2(int);
extern void far * far grp_7a614cef(unsigned int, unsigned int, unsigned int);
extern void far grp_9d44a3bf(void far *);
extern void far fn_cycles_cga_0563e(unsigned long);
extern void far GRP_7DE44506(unsigned int, unsigned int, int);
extern int far fn_cycles_cga_10948(void);
extern void far fn_cycles_cga_072ee(unsigned long);
extern void far GRP_0F3D9549(void far *, int, int);
extern int far fn_cycles_cga_06412(void);

int far grp_5c8b15c8(void)
{
    struct local_frame { void far *profile; int width; int height; int index; int row; int key; } frame;

    fn_cycles_cga_0763a((unsigned int)g_0457a, (unsigned int)g_0457c);
    grp_e76f1ca2(0);
    grp_9d44a3bf(grp_7a614cef(G_013A, G_013C, 0x140));
    grp_9d44a3bf(grp_7a614cef(G_013A, G_013C, 0x145));
    grp_9d44a3bf(grp_7a614cef(G_013A, G_013C, 0x14a));
    fn_cycles_cga_0763a(g_b9ea, g_b9ec);
    grp_e76f1ca2(0);

    for (frame.index = 0; frame.index < 4; ++frame.index) {
        fn_cycles_cga_0563e(1L);
        GRP_7DE44506(g_0457a[0], g_0457a[1], frame.index);
        frame.key = fn_cycles_cga_10948();
        if (frame.key) return frame.key;
    }

    frame.profile = grp_7a614cef(G_013A, G_013C, 0x14f);
    frame.height = *(unsigned int far *)((char far *)frame.profile + 10);
    frame.width = *(unsigned int far *)((char far *)frame.profile + 8) + 3;
    for (frame.row = 0; frame.row < frame.width; frame.row += 2) {
        fn_cycles_cga_072ee(1L);
        GRP_0F3D9549(frame.profile, frame.row, frame.height);
        frame.key = fn_cycles_cga_06412();
        if (frame.key) return frame.key;
    }
    fn_cycles_cga_0563e(0x2dL);
    return fn_cycles_cga_10948();
}

