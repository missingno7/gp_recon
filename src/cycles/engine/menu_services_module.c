typedef struct { unsigned short off, seg; } FarAddress;
struct cycle_service {
    void (far *begin)(int, int, int, int);
    char reserved[16];
    void (far *finish)(void);
};
struct CallbackTable {
    unsigned char reserved0[0x0c];
    void (far *step)(int);
    unsigned char reserved10[4];
    void (far *finish)(void);
};
extern unsigned short g_b9ea;
extern unsigned short g_b9ec;
extern unsigned short g_0724;
extern unsigned short g_0726;
extern unsigned short g_0254;
extern unsigned short g_0438;
extern unsigned short g_4602[256];
extern unsigned short g_a9a[256];
extern int g_0024e;
extern unsigned char g_b9ee[];
extern int g_00254;
extern int g_00438;
extern unsigned char g_b9fc[];
extern int g_00b26;
extern FarAddress g_a8e2;
extern FarAddress g_b206;
extern FarAddress far g_a8e6[32];
extern unsigned short g_8e70;
extern unsigned short g_8e7e;
extern unsigned short g_8e82;
extern unsigned short g_8e6e;
extern unsigned short g_8e7a;
extern unsigned short g_a970;
extern unsigned short g_a972;
extern unsigned short g_a974;
extern unsigned short g_a9ee;
extern unsigned short g_a976;
extern unsigned short g_a966;
extern unsigned short g_a96a;
extern unsigned short g_a96e;
extern struct cycle_service far * g_cycle_service;
extern int g_cycle_limit;
extern int g_cycle_count;
extern unsigned char g_entry_buffer[];
extern struct CallbackTable far * g_08e6a;
extern int g_08e72;
extern int g_08e78;
extern int g_08e70;
extern int g_08e76;
void far fn_cycles_cga_0763a(int, int);
int far fn_cycles_cga_12c30(unsigned long);
void far fn_cycles_cga_0803e(int);
void far fn_cycles_cga_08388(int, int, int, int, int);
void far fn_cycles_cga_11cf2(int, int, int);
int far fn_cycles_cga_0c1ce(int, int, char *);
int far grp_69059c1b(void);
int far grp_69b75d8c(int, int);
void far grp_599ebf4e(int, int, int, int);
int grp_925127fd(unsigned char near *bytes, unsigned count, unsigned char initial);
void far grp_63468620(int, int);
void far grp_2e800973(int);
void far fn_cycles_cga_0559e(int);
void far grp_fc68458d(void);
void far grp_eb3159ee(void);
void far grp_e747cf63(int, int, int, int);
int far fn_cycles_cga_02fe0(unsigned);
void far grp_5695e2e6(void);
int grp_f53aee67(unsigned long key);
void far fn_cycles_cga_036e6(int, int);
void far grp_e6057061(int first, int second, int value, int last_row);
void far fn_cycles_cga_05ef9(int, int, int);
void far fn_cycles_cga_05ef9_long(int, unsigned long);
int far fn_cycles_cga_11e52(int, int, int, int, int, int);
void far fn_cycles_cga_0fd74(int);
int far grp_dd11c81f(int a, int b, int c, int d, int e, int f);
int grp_5ca87e84(char near *text);
void grp_740dd4f2(char near *text);
int grp_4b75cabe(int first, int second);
int grp_4c82477a(int first, int second);
unsigned long far fn_cycles_cga_15574(void);
void far fn_cycles_cga_068d1(int, unsigned long);
int far fn_cycles_cga_03b90(int);
unsigned long far fn_cycles_cga_068c6(char far *, unsigned long);
void far grp_35c9a713(unsigned char far *map, unsigned char far *texts, int index);
void grp_c5bcbe1c(void);
void grp_51debc93(void);
void grp_cf3195ac(void);

int far grp_69059c1b(void)
{
    unsigned long object;
    unsigned int row, i, value;
    char text[48];
    int result;
    object = *(unsigned long far *)&g_0724;
    result = fn_cycles_cga_12c30(object);
    if (result < 0 || !object) return 0;
    fn_cycles_cga_0803e(0);
    fn_cycles_cga_08388(8, 0x32, 0x32, 0x130, 0xaaaa);
    fn_cycles_cga_11cf2(8, 0x32, 0x32);
    fn_cycles_cga_0c1ce(g_0438 * 4 + 0xa9a, 0xa3d, text);
    fn_cycles_cga_11cf2(0xf, 0x44, (int)text);
    for (i = 0; i < 12; ++i) {
        row = i * 0x12 + g_0254 * 0xd8 + g_0438 * 0x48;
        value = g_4602[row / 2];
        result = fn_cycles_cga_12c30(value);
        text[0] = (char)result;
        fn_cycles_cga_0c1ce((int)text, row, text);
        fn_cycles_cga_11cf2(result, row, (int)text);
    }
    fn_cycles_cga_0763a(g_b9ea, g_b9ec);
    return result;
}

void far grp_fc68458d(void)
{
    unsigned state_address;
    char ch;
    state_address = grp_69b75d8c(0x0aad, 0x0aaa);
    if (state_address == 0)
        fn_cycles_cga_0559e(0x0ab8);
    grp_599ebf4e(0xb9ee, 0xd8, g_0024e, state_address);
    ch = (char)grp_925127fd(0xb9ee, 0xd8 * g_0024e, 0x11);
    if (--*(int near *)(state_address + 2) >= 0) {
        *((char near *)*(unsigned near *)state_address) = ch;
        ++*(unsigned near *)state_address;
    } else {
        grp_63468620(state_address, (signed char)ch);
    }
    grp_2e800973(state_address);
}

void far grp_eb3159ee(void)
{
    int row, column, address;
    for (row = 0; row < 3; ++row) {
        for (column = 0; column < 4; ++column) {
            address = row * 0x48 + column * 0x12;
            *(unsigned near *)(g_b9ee + address - 0x4604) = 0xffff;
            *(unsigned near *)(g_b9ee + address - 0x4602) = 0xffff;
            grp_63468620((unsigned)(g_b9ee + address + 0xd), 0, 0xd);
        }
    }
    for (row = 1; row < g_0024e; ++row) {
        memcpy(g_b9ee + row * 0xd8 - 0x4612,
               g_b9ee + row * 0xd8 - 0x46ea, 0xd8);
    }
    grp_fc68458d();
}

void far grp_5695e2e6(void)
{
    unsigned buffer;
    char input;
    buffer = grp_69b75d8c(0xae6, 0xae3);
    if (buffer == 0) {
        grp_eb3159ee();
        buffer = grp_69b75d8c(0xaf4, 0xaf1);
    }
    if (buffer == 0)
        fn_cycles_cga_0559e(0xaff);
    grp_e747cf63(buffer, g_0024e, 0xd8, 0xb9ee);
    if (--*(int near *)(buffer + 2) >= 0) {
        input = *((char near *)*(unsigned near *)buffer);
        ++*(unsigned near *)buffer;
    } else {
        input = (char)fn_cycles_cga_02fe0(buffer);
    }
    grp_2e800973(buffer);
    if ((char)grp_925127fd(0xb9ee, 0xd8 * g_0024e, 0x11) != input)
        grp_eb3159ee();
}

int grp_925127fd(unsigned char near *bytes, unsigned count, unsigned char initial)
{
    unsigned char checksum = initial;
    while (count--)
        checksum ^= *bytes++;
    return (signed char)checksum;
}

int grp_f53aee67(unsigned long key)
{
    int index = 0;
    for (; index < 4; index++) {
        if (*(unsigned long *)(g_b9fc + g_00254 * 216 + g_00438 * 72 + index * 18) > key)
            return index;
    }
    return -1;
}

void far grp_e6057061(int first, int second, int value, int last_row)
{
    int row;
    register int index;
    for (row = 3; row > last_row; --row) {
        index = row * 0x12;
        index += g_00254 * 0xd8;
        index += g_00438 * 0x48;
        *(int *)(g_b9ee + index - 0x4604) = *(int *)(g_b9ee + index - 0x4616);
        *(int *)(g_b9ee + index - 0x4602) = *(int *)(g_b9ee + index - 0x4614);
        fn_cycles_cga_036e6((int)(g_b9ee + index - 0x4604),
                            (int)(g_b9ee + index - 0x4616));
    }
    index = last_row * 0x12;
    index += g_00254 * 0xd8;
    index += g_00438 * 0x48;
    *(int *)(g_b9ee + index - 0x4604) = first;
    *(int *)(g_b9ee + index - 0x4602) = second;
    fn_cycles_cga_036e6((int)(g_b9ee + index - 0x4604), value);
}

int far grp_dd11c81f(int a, int b, int c, int d, int e, int f)
{
    int result;
    fn_cycles_cga_05ef9(0x70, 0, 0);
    result = fn_cycles_cga_11e52(a, b, c, d, e, f);
    fn_cycles_cga_0fd74(a);
    fn_cycles_cga_05ef9_long(0x70, 0x05553564L);
    return result;
}

void grp_740dd4f2(char near *text)
{
    int index;
    index = grp_5ca87e84(text) - 1;
    while (text[index] == ' ') {
        if (index < 0)
            break;
        text[index--] = 0;
    }
}

int grp_4c82477a(int first, int second)
{
    if (second > 0)
        goto call_helper;
    if (second < 0)
        goto fallback;
    if (first != 0)
        goto call_helper;
fallback:
    return g_00b26;
call_helper:
    return grp_4b75cabe(first, second);
}

void far grp_35c9a713(unsigned char far *map, unsigned char far *texts, int index)
{
    unsigned short count, i, n;
    unsigned long raw;
    unsigned char far *selected;
    unsigned char far *entry;
    unsigned char far *slot;
    unsigned long names[32];
    unsigned char small[4];
    fn_cycles_cga_15574();
    if (!map || !texts) return;
    raw = (unsigned long)map;
    g_a8e2.off = (unsigned short)raw;
    g_a8e2.seg = (unsigned short)(raw >> 16);
    count = 0;
    entry = map + 4;
    while (*(int far *)entry != -1) { ++count; entry += 2; }
    if (index >= count) return;
    selected = map + *(unsigned short far *)(map + 4 + index * 2);
    raw = (unsigned long)selected;
    g_b206.off = (unsigned short)raw;
    g_b206.seg = (unsigned short)(raw >> 16);
    g_8e7e = 0;
    g_8e82 = 0x80;
    g_a970 = 0; g_a972 = 0; g_a974 = 0;
    for (i = 0; i < 12; ++i) {
        slot = selected + i * 0x8a;
        if (*(int far *)slot != -1) {
            g_a976 = *(unsigned short far *)slot;
        } else {
            g_a976 = 0;
        }
    }
    g_8e70 = count;
    n = 0;
    for (i = 0; i < 32; ++i) {
        unsigned char far *p = selected + 0x18 + i * 4;
        if (!p[0]) break;
        small[0] = p[0]; small[1] = p[1]; small[2] = p[2]; small[3] = p[3];
        names[n++] = fn_cycles_cga_068c6((char far *)small, (unsigned long)texts);
    }
    for (i = 0; i < n; ++i) g_a8e6[i] = *(FarAddress *)&names[i];
    g_8e6e = n;
    g_8e7a = 1;
}

void grp_c5bcbe1c(void)
{
    register unsigned char *entry = g_entry_buffer;
    register int index;
    volatile int saved_index = 0;
    g_cycle_count = 0;
    for (index = 0; index <= g_cycle_limit; ++index) {
        *(int *)entry = 0;
        *(int *)(entry + 2) = 0;
        g_cycle_service->begin(0, 0, 0, index);
        entry += 138;
    }
    saved_index = index;
    g_cycle_service->finish();
}

void grp_51debc93(void)
{
    register int i;
    int final_i;
    g_08e78 = 0;
    for (i = 0x0c; i <= g_08e72; ++i)
        g_08e6a->step(i);
    final_i = i;
    g_08e6a->finish();
}

void grp_cf3195ac(void)
{
    register int i;
    int final_i;
    g_08e76 = 0;
    for (i = 0; i <= g_08e70; ++i)
        g_08e6a->step(i);
    final_i = i;
    g_08e6a->finish();
}
