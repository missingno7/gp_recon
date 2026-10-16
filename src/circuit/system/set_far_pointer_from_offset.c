extern unsigned int g_cir_8de4;
extern unsigned int g_cir_8de6;

void set_far_pointer_from_offset(unsigned int offset)
{
    g_cir_8de4 = offset;
    g_cir_8de6 = 0;
}
