extern void far grp_ef48a1e7(void);
#pragma alloc_text(EF48A1E7_EGA_TEXT, grp_ef48a1e7)

extern void far fn_cycles_cga_05ef9(unsigned int, char far *);
extern char far intro_text_three[];
extern char far introseg_056a_0753_ef48a1e7[];
extern char far intro_text_two[];
extern char far introseg_056a_07ab_ef48a1e7[];
extern char far introseg_056a_076c_ef48a1e7[];
extern char far intro_text_one[];

void far grp_ef48a1e7(void)
{
    fn_cycles_cga_05ef9(10, intro_text_three);
    fn_cycles_cga_05ef9(11, introseg_056a_0753_ef48a1e7);
    fn_cycles_cga_05ef9(16, intro_text_two);
    fn_cycles_cga_05ef9(17, introseg_056a_07ab_ef48a1e7);
    fn_cycles_cga_05ef9(19, introseg_056a_076c_ef48a1e7);
    fn_cycles_cga_05ef9(24, intro_text_one);
}
