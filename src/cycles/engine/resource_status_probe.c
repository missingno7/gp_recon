extern void far fn_cycles_cga_0563e(unsigned int, unsigned int);
extern unsigned int far fn_cycles_cga_10948(void);
extern unsigned int g_0098;

unsigned int fn_cycles_ega_0fd34(unsigned int first, unsigned int second)
{
    unsigned int result;
    fn_cycles_cga_0563e(first, second);
    result = fn_cycles_cga_10948();
    if (result)
        g_0098 = 0;
    return result;
}
