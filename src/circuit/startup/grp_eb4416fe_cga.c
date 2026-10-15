extern void grp_e76f1ca2(unsigned int);
extern unsigned long grp_f3a4e254(unsigned int, unsigned int, unsigned int);
extern void grp_9d44a3bf(unsigned long);
extern void fn_circuit_cga_06a72(long);
extern void fn_circuit_cga_06a1e(void);
extern unsigned int g_00052, g_00054;
void grp_eb4416fe(void) {
    union { unsigned long value; unsigned char scratch[8]; } local;
    grp_e76f1ca2(0);
    local.value = grp_f3a4e254(g_00052, g_00054, 0x8f36);
    grp_9d44a3bf(local.value);
    fn_circuit_cga_06a72(0xb4L);
    fn_circuit_cga_06a1e();
}
