extern void fn_circuit_ega_072fc(void);
extern void fn_circuit_ega_0776f(void);
extern void fn_circuit_ega_06ffe(void);
extern void grp_e5a16c1f(int, int, int, int, int);
extern void report_error_and_exit(void);

void fn_circuit_ega_0ddd8(int first, int second, int third, int fourth, int fifth)
{
    fn_circuit_ega_072fc();
    fn_circuit_ega_0776f();
    fn_circuit_ega_06ffe();
    grp_e5a16c1f(first, second, third, fourth, fifth);
    report_error_and_exit();
}
