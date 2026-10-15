extern void fn_cycles_cga_10024(void);
extern void fn_cycles_cga_1007e(void);
extern void fn_cycles_cga_059e2(void);
extern void fn_cycles_cga_05ef9(int, char far *);
extern char far intro_text_one[];
extern char far intro_text_two[];
extern char far intro_text_three[];
void grp_1c2275e7(void)
{
    fn_cycles_cga_10024();
    fn_cycles_cga_1007e();
    fn_cycles_cga_05ef9(0x18, intro_text_one);
    fn_cycles_cga_05ef9(0x70, intro_text_two);
    fn_cycles_cga_05ef9(0x0a, intro_text_three);
    fn_cycles_cga_059e2();
}
