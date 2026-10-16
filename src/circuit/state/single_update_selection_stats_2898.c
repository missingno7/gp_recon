extern unsigned char g_096ce, g_0990c;
extern unsigned int g_0028e, g_00298;
extern unsigned long g_00292;
extern unsigned int g_09bd8;
void update_selection_stats_2898(unsigned int value) {
    if (g_096ce && !g_0990c) {
        g_00292 += value;
        if (value > g_00298) g_00298 = value;
        ++g_0028e;
        --g_09bd8;
    }
}
