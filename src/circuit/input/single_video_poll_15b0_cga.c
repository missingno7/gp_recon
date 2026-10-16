extern int fn_circuit_cga_06a72(int, int);
extern int fn_circuit_cga_06a1e(void);
extern unsigned int g_0004a;
int single_video_poll_15b0(int x, int y) {
    int result;
    fn_circuit_cga_06a72(x, y);
    result = fn_circuit_cga_06a1e();
    if (result) {
        g_0004a = 0;
        return 1;
    }
    return 0;
}
