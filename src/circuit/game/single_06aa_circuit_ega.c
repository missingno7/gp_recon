extern unsigned long g_00056, g_096dc, g_0004e, g_00052;
extern void grp_fe15c5cd(unsigned int);
extern unsigned long grp_aa88d69b(unsigned int);
extern unsigned long FN_CIRCUIT_EGA_08BF2(void);
extern void FN_CIRCUIT_EGA_03FA0(unsigned int);
extern int grp_f8ffa5a4(void);
extern int grp_eb4416fe(void);
extern int grp_1f3dd2b2(void);
extern int grp_eb4416fe(void);
extern void FN_CIRCUIT_EGA_06872(long);
extern int FN_CIRCUIT_EGA_0681E(void);
extern void FN_CIRCUIT_EGA_03FCA(void);
extern void grp_3f05a1a6(unsigned long);

int grp_006aa(void)
{
    int result;
    grp_fe15c5cd(0);
    g_00056 = grp_aa88d69b(0x8e30);
    g_096dc = FN_CIRCUIT_EGA_08BF2();
    g_0004e = grp_aa88d69b(0x8e3a);
    g_096dc = FN_CIRCUIT_EGA_08BF2() - g_096dc;
    g_00052 = grp_aa88d69b(0x8e44);
    FN_CIRCUIT_EGA_03FA0(2);
    if ((int)(g_096dc >> 16) < 0) goto try_timing;
    if ((int)(g_096dc >> 16) > 0) goto timing_done;
    if ((unsigned int)g_096dc > 0x0fa0) goto timing_done;
try_timing:
    result = grp_f8ffa5a4();
timing_done: ;
    if (result == 0) result = grp_eb4416fe();
    if (result == 0) result = grp_1f3dd2b2();
    if (result == 0) result = grp_eb4416fe();
    if (result == 0) { FN_CIRCUIT_EGA_06872(0x10eL); result = FN_CIRCUIT_EGA_0681E(); }
    FN_CIRCUIT_EGA_03FCA();
    grp_3f05a1a6(g_00052);
    grp_3f05a1a6(g_0004e);
    grp_3f05a1a6(g_00056);
    return result;
}
