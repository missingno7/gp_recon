extern int g_003a0, g_0024e;
extern unsigned char g_b9ee[];
extern int g_c8e4[];
extern unsigned grp_69b75d8c(unsigned, unsigned);
extern void far grp_e747cf63(int, int, int, int);
extern void far fn_cycles_cga_0559e(int);
extern void far grp_2e800973(unsigned);
extern void far fn_cycles_cga_0fc5c(void);
void far grp_324ee638(void)
{
    unsigned buffer;
    int index;
    if (g_003a0 != 0)
        return;
    buffer = grp_69b75d8c(0x378, 0x375);
    if (buffer == 0)
        fn_cycles_cga_0559e(0x383);
    grp_e747cf63(0x24e, 2, 1, buffer);
    grp_e747cf63(0xc8a0, 0x46, g_0024e, buffer);
    grp_2e800973(buffer);
    fn_cycles_cga_0fc5c();
    for (index = 0; index < g_0024e; ++index)
        g_c8e4[index * 0x23] = (unsigned)(g_b9ee + index * 0xd8);
    g_003a0 = 1;
}


