typedef unsigned short U16;

extern U16 g_cir_8b44;
extern U16 g_cir_8b46;
extern U16 g_cir_8b4a;
extern U16 g_cir_8b4c;

void fn_circuit_ega_08c84(U16 first, U16 second)
{
    g_cir_8b46 = second;
    g_cir_8b44 = first;
}

void fn_circuit_ega_08c95(U16 first, U16 second)
{
    g_cir_8b4a = first;
    g_cir_8b4c = second;
}
