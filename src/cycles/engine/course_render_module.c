struct Table8 {
    unsigned char first[8];
    unsigned char second[8];
};
struct Table4 {
    unsigned char first[4];
    unsigned char second[4];
};
extern unsigned g_cd0e;
extern unsigned g_cd0c;
extern unsigned g_b78e;
extern unsigned g_b78c;
extern char far intro_text_one[];
extern char far intro_text_two[];
extern char far intro_text_three[];
extern unsigned short g_215a;
extern unsigned short g_b36;
extern unsigned short g_b58;
extern unsigned short g_45b4;
extern unsigned short g_2118;
extern unsigned short g_45b6;
extern unsigned short g_b56;
extern unsigned short g_2166;
extern unsigned short g_45c5;
extern unsigned short g_b7c6;
extern unsigned short g_2092;
extern unsigned short g_209c;
extern unsigned short g_c898;
extern unsigned short g_b5a[128];
extern unsigned short g_574a[8];
extern unsigned short g_574c[8];
extern unsigned short g_5792[8];
extern unsigned short g_5794[8];
extern unsigned short g_576e[8];
extern unsigned short g_5770[8];
extern unsigned short g_586a[64];
extern unsigned short g_586c[64];
extern unsigned short g_5846[64];
extern unsigned short g_5848[64];
extern unsigned short g_57da[128];
extern unsigned short g_57dc[128];
extern unsigned short g_57b6[128];
extern unsigned short g_57b8[128];
extern int g_45a0;
extern int g_0ef4;
extern int g_b8e[];
extern int g_045be;
extern int g_b6a[];
extern int g_b7c[];
extern unsigned char g_ba5[];
extern unsigned char g_ba4[];
extern int g_ba2;
extern int g_ba0;
extern struct Table8 g_0b7ac;
extern struct Table4 g_0cd14;
extern int g_43b6[];
extern int g_43b8[];
extern unsigned char g_04568;
extern int g_02252[];
extern int g_02018;
extern int g_08e46;
extern int g_08e44;
extern unsigned char far * g_b9ea_pointer;
extern int g_0cd20;
extern int g_04558;
extern int g_00ef6;
extern int g_02078;
extern int g_a8ba;
extern int g_0457e;
extern int g_04580;
extern int g_02072;
extern int g_a8bc;
extern int g_02074;
extern int g_a8be;
extern unsigned short g_4584;
extern unsigned short g_4586;
extern unsigned short g_59ac;
extern unsigned short g_59ae;
extern unsigned short g_45a6;
extern unsigned short g_45aa;
extern unsigned short g_28e4;
extern unsigned short g_28e6;
extern unsigned short g_28e8;
extern unsigned short g_28ea;
extern unsigned short g_28ec;
extern unsigned char g_b230[128];
extern int g_00dbc[];
void far fn_cycles_cga_09f14(int, int);
void far fn_cycles_cga_08fc2(int, int, int);
void far fn_cycles_cga_05667(long);
void far grp_c3517998(int first, int second, int third, int fourth, int fifth, int sixth);
void far fn_cycles_cga_063c6(void);
void far fn_cycles_cga_059e2(void);
void far fn_cycles_cga_05ada(void far *);
void far fn_cycles_cga_05ef9(int, void far *);
void far fn_cycles_cga_10076(void);
void far grp_35c9a713(int, int, int, int, int);
void far fn_cycles_cga_10138(void);
void far fn_cycles_cga_0556e(void);
void far fn_cycles_cga_0557e(void);
void far fn_cycles_cga_0558e(void);
void far grp_7037b130(int value);
void fn_cycles_cga_10024(void);
void fn_cycles_cga_1007e(void);
void grp_1c2275e7(void);
int far fn_cycles_cga_03b32(int);
unsigned int far fn_cycles_cga_03b5a(void);
void far fn_cycles_cga_08c0e(unsigned long, int, int);
void far fn_cycles_cga_0769e(unsigned long, int, int);
void far fn_cycles_cga_0932a(unsigned long, int, int);
void far fn_cycles_cga_10d96(int, int);
void far grp_a51db326(void);
void far grp_0ea93981(void);
void far fn_cycles_cga_05710(int, int, int, int, int);
void far grp_39561b99(int item, int delta);
void grp_9ea5b57e(void);
int far grp_9ad82dae(int mode, int y);
void far fn_cycles_cga_0763a(unsigned char far *);
int far grp_12270e9a(int bottom_limit);
void far fn_cycles_cga_07ff5(int, int, int, int);
void far fn_cycles_cga_08bea(int, int, int, int);
void far grp_60a768aa(void);
void far fn_cycles_cga_08c2c(int, int);
long far fn_cycles_cga_03c2c(long, long);
int far fn_cycles_cga_07172(int);
int far fn_cycles_cga_07124(int);
long far fn_cycles_cga_03ca8(long, int, int);
void far fn_cycles_cga_09c70(int, int);
void far grp_083c9f89(void);
void far grp_b141533d(int, int, int, int, int, int);
void far grp_9c73fa69(int, int, int, int, int);
void far grp_9a69383f(int x0, int y0, int x1, int y1, int mode, register int count);
int far grp_ee68b6d0(int);
void far fn_cycles_cga_086da(int, int, int);
void far grp_8c455c08(int index);

void far grp_c3517998(int first, int second, int third, int fourth, int fifth, int sixth)
{
    int i;
    for (i = 0; i < 5; ++i) {
        fn_cycles_cga_09f14(fourth, sixth);
        fn_cycles_cga_08fc2(first, second, third);
        fn_cycles_cga_05667(4L);
        fn_cycles_cga_09f14(fifth, sixth);
        fn_cycles_cga_08fc2(first, second, third);
        fn_cycles_cga_05667(4L);
    }
}

void far grp_7037b130(int value)
{
    fn_cycles_cga_063c6();
    fn_cycles_cga_059e2();
    fn_cycles_cga_05ada((void far *)fn_cycles_cga_10138);
    fn_cycles_cga_05ef9(0x18, (void far *)fn_cycles_cga_0556e);
    fn_cycles_cga_05ef9(0x70, (void far *)fn_cycles_cga_0557e);
    fn_cycles_cga_05ef9(0x0a, (void far *)fn_cycles_cga_0558e);
    fn_cycles_cga_10076();
    grp_35c9a713(g_b78c, g_b78e, g_cd0c, g_cd0e, value);
}

void grp_1c2275e7(void)
{
    fn_cycles_cga_10024();
    fn_cycles_cga_1007e();
    fn_cycles_cga_05ef9(0x18, intro_text_one);
    fn_cycles_cga_05ef9(0x70, intro_text_two);
    fn_cycles_cga_05ef9(0x0a, intro_text_three);
    fn_cycles_cga_059e2();
}

void far grp_a51db326(void)
{
    int shift, position, mode, amount, delta, row, style;
    unsigned long object;
    shift = 4 - (int)(g_215a / 0x140);
    if (shift < 0) shift = 0;
    if (shift > 8) shift = 8;
    position = g_b36 / 0xa0 + 0x20;
    delta = position - g_b58;
    if (fn_cycles_cga_03b32(delta) >= 3)
        position = delta / 3 + g_b58;
    if (g_45b4 || g_2118) {
        mode = (g_45b6 & 4) ? 6 : 2;
        g_b56 = mode;
        g_2166 = 0;
        if (g_45b6 < 0xf)
            g_2166 = (unsigned char)g_45c5 * *(unsigned short far *)(0xb38 + g_45b6 * 2) * 5;
        amount = g_2166;
        if (fn_cycles_cga_03b32(amount) > 0x1800)
            g_2166 = (amount < 0 ? -0x1800 : 0x1800);
        g_b7c6 = (fn_cycles_cga_03b5a() >> 3) + 0x7a;
        position -= g_45b6 << 2;
    }
    row = shift;
    object = *(unsigned long far *)(g_574a[row] + g_574c[row] * 0x10000UL);
    amount = *(int far *)(object + 0xa) - position;
    fn_cycles_cga_08c0e(object, *(int far *)(object + 8), amount);
    object = *(unsigned long far *)(g_5792[row] + g_5794[row] * 0x10000UL);
    amount = *(int far *)(object + 0xa) - position;
    fn_cycles_cga_0769e(object, *(int far *)(object + 8), amount);
    object = *(unsigned long far *)(g_576e[row] + g_5770[row] * 0x10000UL);
    fn_cycles_cga_0932a(object, *(int far *)(object + 8), amount);
    g_c898 = amount;
    row = g_2092 / 2;
    style = g_b5a[row];
    if (g_209c == 0xff) style = 0x5a;
    else if (g_209c == 1) style = 0x12;
    else if (g_209c == 0) style = 0;
    row += style;
    object = *(unsigned long far *)(g_57da[row] + g_57dc[row] * 0x10000UL);
    amount = *(int far *)(object + 0xa) - position;
    fn_cycles_cga_0769e(object, *(int far *)(object + 8), amount);
    object = *(unsigned long far *)(g_57b6[row] + g_57b8[row] * 0x10000UL);
    fn_cycles_cga_0932a(object, *(int far *)(object + 8), amount);
    fn_cycles_cga_10d96(position, shift);
}

void far grp_0ea93981(void)
{
    int scaled;
    scaled = ((g_2166 / 256) * g_45a0) / 256;
    g_0ef4 = g_b7c6 - fn_cycles_cga_03b32(g_215a / 256) * 4 - scaled;
    if (g_0ef4 < 0x82)
        g_0ef4 = 0x82;
}

void far grp_39561b99(int item, int delta)
{
    int left;
    int top;
    volatile int row;
    row = ((g_b8e[item] + g_045be) / 0xe0) * 2;
    if (row < 0)
        row = 0;
    left = g_b6a[item] - 7;
    top = g_b7c[item] - delta + 3;
    fn_cycles_cga_05710(g_ba0 + left, g_ba2 + top,
                        left + g_ba4[row], top + g_ba5[row], 0xff);
}

void grp_9ea5b57e(void)
{
    int i;
    i = 0;
    do {
        g_0b7ac.first[i] = 0;
        g_0b7ac.second[i] = 0;
        ++i;
    } while (i < 8);
    i = 0;
    do {
        g_0cd14.first[i] = 0;
        g_0cd14.second[i] = 0;
        ++i;
    } while (i < 4);
}

int far grp_9ad82dae(int mode, int y)
{
    int row, value, x1, x2, y1, y2;
    row = (y - 1) / 2;
    value = g_43b6[row];
    x1 = 7 - (((value < 0) ? -value : value) >> 3);
    x2 = 7 - (((value < 0) ? -value : value) >> 2);
    value = g_43b8[row];
    y1 = 7 - (((value < 0) ? -value : value) >> 2);
    if (g_04568) {
        mode = 0;
        value = g_02252[-row];
        y2 = 8 - g_02018;
        if (row >= 0x25)
            return 0;
    } else {
        value = g_02252[row];
        y2 = g_02018;
        if (row >= 0x47)
            return 0;
    }
    if (value == g_08e46 && g_08e44 == -1)
        return -2;
    return mode + x1 + x2 + y1 + y2;
}

void far grp_60a768aa(void)
{
    int old_position;
    int position;
    fn_cycles_cga_0763a(g_b9ea_pointer);
    if (g_0cd20 != 0) {
        g_04558 = 0;
        g_0cd20 = 0;
    }
    position = g_04558;
    if (position > g_00ef6 - 0x23)
        position = g_00ef6 - 0x23;
    if (position > g_02078 - 0x23)
        position = g_02078 - 0x23;
    if (position > g_c898)
        position = g_c898;
    if (position > g_a8ba) {
        old_position = position;
        position = g_a8ba;
        g_a8ba = old_position;
    } else {
        g_a8ba = position;
    }
    if (position < 0)
        position = 0;
    grp_12270e9a(position);
    fn_cycles_cga_07ff5(0, 0x140, position + 0x29, 0xc8);
    fn_cycles_cga_08bea(g_0457e, g_04580, 0, 0x29);
}

int far grp_12270e9a(int bottom_limit)
{
    int bottom, top, right, left;
    if (g_a8bc < g_02072) {
        left = g_a8bc;
        right = g_02072;
    } else {
        left = g_02072;
        right = g_a8bc;
    }
    right += 0x70;
    if (g_a8be < g_02074) {
        top = g_a8be;
        bottom = g_02074;
    } else {
        top = g_02074;
        bottom = g_a8be;
    }
    bottom += 0x0e;
    g_a8bc = g_02072;
    g_a8be = g_02074;
    if (left < 0)
        left = 0;
    if (right <= 0 || left >= 0x140)
        return 0;
    if (right > 0x140)
        right = 0x140;
    if (bottom > bottom_limit)
        bottom = bottom_limit;
    fn_cycles_cga_07ff5(left, right, top + 0x29, bottom + 0x29);
    fn_cycles_cga_08bea(g_0457e, g_04580, 0, 0x29);
    return 0;
}

void far grp_083c9f89(void)
{
    unsigned int pos, remain;
    char far *cursor;
    int angle;
    long x, y, initial;
    volatile char spare[52];
    fn_cycles_cga_0763a(g_4584, g_4586);
    fn_cycles_cga_08c2c(g_59ac, g_59ae);
    cursor = (char far *)g_45a6;
    remain = g_45aa + 0x48;
    pos = 0;
    angle = g_28e4;
    initial = fn_cycles_cga_03c2c((long)g_28ea, (long)g_28e6) * 2L;
    x = initial;
    y = fn_cycles_cga_03c2c((long)g_28ea, (long)g_28e8) * 2L;
    while (remain--) {
        angle += (signed char)cursor[pos++];
        x += fn_cycles_cga_07172(angle) >> 1;
        y += fn_cycles_cga_07124(angle) >> 1;
        g_b230[pos] = (unsigned char)(fn_cycles_cga_03ca8(x, g_28ea, 0) >> 1);
        g_b230[pos + 1] = (unsigned char)(fn_cycles_cga_03ca8(y, g_28ea, 0) >> 1);
        if (((x >> 16) > 0 || x == 0) && ((y >> 16) > 0 || y == 0)) spare[pos & 3] = 0;
        if ((remain & 7) == 0) pos += 2;
    }
    fn_cycles_cga_09c70(g_59ac, g_59ae);
    g_28ec = 0xb230;
}

void far grp_9a69383f(int x0, int y0, int x1, int y1, int mode, register int count)
{
    int half_up;
    int saved_count;
    int half_down;
    if (count < 0)
        count = 0;
    half_up = (count + 1) / 2;
    saved_count = count;
    half_down = count / 2;
    grp_b141533d(x0, y0, x1, y1, mode, count);
    grp_9c73fa69(x1 - half_up, y1 - half_down,
                 count + 1, saved_count, 0);
}

void far grp_8c455c08(int index)
{
    register int selected;
    int x;
    g_04558 = 0;
    selected = g_00dbc[index];
    x = (0x140 - grp_ee68b6d0(selected)) / 2;
    fn_cycles_cga_09f14(0, 0);
    fn_cycles_cga_086da(selected, x, 0x3c);
    fn_cycles_cga_09f14(2, 0);
    fn_cycles_cga_086da(selected, x - 1, 0x3b);
}
