extern int g_cir_9684;
extern int g_cir_9688;
extern void grp_63882bd9(int);

void fn_circuit_ega_0f1ba(void)
{
    grp_63882bd9(0x30);
    if (g_cir_9684 == 0x10) {
        if (g_cir_9688 != 0)
            grp_63882bd9(0x58);
        else
            grp_63882bd9(0x78);
    }
}
