struct CallbackTable {
    unsigned char reserved0[0x0c];
    void (far *step)(int);
    unsigned char reserved10[4];
    void (far *finish)(void);
};
extern struct CallbackTable far *g_08e6a;
extern int g_08e70;
extern int g_08e74;
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
