extern int far STRLEN(char *text);
extern int g_cga_0304;

int far cycles_ega_0f7e4(int value) {
    if (STRLEN((char *)value) <= 0)
        return g_cga_0304;
    return value;
}
