extern void fn_circuit_ega_09394(unsigned int);
extern unsigned long grp_f3a4e254(unsigned int, unsigned int, unsigned int);
extern void fn_circuit_ega_0b1b6(unsigned long);
extern void fn_circuit_ega_06872(long);
extern void fn_circuit_ega_0681e(void);
extern unsigned int g_00052, g_00054;
void grp_eb4416fe(void) {
    union { unsigned long value; unsigned char scratch[8]; } local;
    fn_circuit_ega_09394(0);
    local.value = grp_f3a4e254(g_00052, g_00054, 0x8f5e);
    fn_circuit_ega_0b1b6(local.value);
    fn_circuit_ega_06872(0xb4L);
    fn_circuit_ega_0681e();
}
