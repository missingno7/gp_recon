extern void far grp_7037b130(int);
#pragma alloc_text(GAP_7037B130_TEXT, grp_7037b130)
extern void far fn_cycles_cga_063c6(void);
extern void far fn_cycles_cga_059e2(void);
extern void far fn_cycles_cga_05ada(char far *);
extern void far fn_cycles_cga_05ef9_long(int, char far *);
extern void far FN_CYCLES_CGA_10076(void);
extern void far grp_35c9a713(int, int, int, int, int);
extern char far cycles_aux_0920[];
extern char far cycles_main_0010[];
extern char far cycles_main_0020[];
extern char far cycles_main_0030[];
extern int g_cga_cd0e, g_cga_cd0c, g_cga_b78e, g_cga_b78c;
void far grp_7037b130(int arg)
{
    fn_cycles_cga_063c6();
    fn_cycles_cga_059e2();
    fn_cycles_cga_05ada(cycles_aux_0920);
    fn_cycles_cga_05ef9_long(0x18, cycles_main_0010);
    fn_cycles_cga_05ef9_long(0x70, cycles_main_0020);
    fn_cycles_cga_05ef9_long(0x0a, cycles_main_0030);
    FN_CYCLES_CGA_10076();
    grp_35c9a713(g_cga_b78c, g_cga_b78e, g_cga_cd0c, g_cga_cd0e, arg);
}
