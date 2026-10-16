extern volatile unsigned char g_cir_8019;

void circuit_clear_flag_8b9b(void)
{
    g_cir_8019 = 0;
}
