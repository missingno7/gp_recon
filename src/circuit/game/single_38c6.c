extern unsigned int g_09c2e, g_09c30, g_0990e, g_00288;
extern void FN_CIRCUIT_EGA_08CD8(unsigned int, unsigned int);
extern unsigned long FN_CIRCUIT_EGA_0A464(unsigned int);
extern unsigned long FN_CIRCUIT_EGA_07DA1(unsigned long, unsigned int);
extern void FN_CIRCUIT_EGA_0B1B6(unsigned long);
extern void FN_CIRCUIT_EGA_0847B(unsigned long);

void grp_038c6(void)
{
    unsigned long second;
    {
        unsigned long first;
        FN_CIRCUIT_EGA_08CD8(g_09c2e, g_09c30);
        first = FN_CIRCUIT_EGA_0A464(0x93c8);
        FN_CIRCUIT_EGA_0B1B6(FN_CIRCUIT_EGA_07DA1(first, 0x93d0));
        if (g_0990e != 3) {
            second = FN_CIRCUIT_EGA_0A464(0x93d6);
            FN_CIRCUIT_EGA_0B1B6(FN_CIRCUIT_EGA_07DA1(second, g_00288 * 5 + 0x134));
            FN_CIRCUIT_EGA_0847B(second);
        }
        FN_CIRCUIT_EGA_0847B(first);
    }
}
