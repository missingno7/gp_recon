extern int g_09bbc;
extern int g_098e8;
extern int g_06182;
extern int g_06180;
extern int g_06186;
extern int g_06184;
extern int g_096d6;
extern int g_09cfa;
extern int g_09cf8;
extern int g_0618a;
extern int g_06188;
extern int g_0618e;
extern int g_0618c;
extern int g_09cfe;
extern int g_09cfc;
extern unsigned char g_096ce;

extern void fn_circuit_ega_0b1b6(int, int);
extern void fn_circuit_ega_0be96(int, int);
extern void fn_circuit_ega_08ba1(int, int);

int grp_2790(int *status) {
    g_098e8 -= g_09bbc;
    if (g_098e8 <= 0) {
        *status = 0;
        return 0;
    }

    if (g_098e8 < 300)
        fn_circuit_ega_0b1b6(g_06180, g_06182);

    if (g_098e8 < 235) {
        fn_circuit_ega_0be96(g_06184, g_06186);
        if (g_096d6 == 1) {
            fn_circuit_ega_08ba1(g_09cf8, g_09cfa);
            ++g_096d6;
        }
    }

    if (g_098e8 < 150) {
        fn_circuit_ega_0be96(g_06188, g_0618a);
        if (g_096d6 == 2) {
            fn_circuit_ega_08ba1(g_09cf8, g_09cfa);
            ++g_096d6;
        }
    }

    if (g_098e8 < 65) {
        fn_circuit_ega_0be96(g_0618c, g_0618e);
        if (g_096d6 == 3) {
            fn_circuit_ega_08ba1(g_09cfc, g_09cfe);
            ++g_096d6;
            g_096ce = 1;
        }
    }
}
