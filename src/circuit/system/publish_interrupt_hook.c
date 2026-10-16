extern void _disable(void);
extern void _enable(void);
#pragma intrinsic(_disable, _enable)

extern unsigned int g_cir_800e;
extern unsigned int g_cir_8010;
extern unsigned char g_cir_8019;
extern unsigned char g_8018;
extern unsigned int g_cir_800a;
extern unsigned int g_cir_800c;

void fn_circuit_ega_08b70(unsigned int first, unsigned int second)
{
    _disable();
    g_cir_800e = second;
    g_cir_8010 = first;
    g_cir_8019 = 1;
    if (g_8018 == 0) {
        g_cir_800a = second;
        g_cir_800c = first;
    }
    _enable();
}
