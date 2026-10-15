extern unsigned long fn_circuit_ega_07d96(unsigned int, unsigned int, unsigned char *);
extern unsigned long grp_f3a4e254(unsigned int, unsigned int, unsigned char *);
void grp_5cbcc9b3(unsigned int a, unsigned int b, unsigned char *scan, unsigned long *out) {
    unsigned int i = 0;
    while (*scan) { out[i++] = fn_circuit_ega_07d96(a, b, scan); scan += 4; }
}
void grp_638b16a8(unsigned int a, unsigned int b, unsigned char *scan, unsigned long *out) {
    unsigned int i = 0;
    while (*scan) { out[i++] = fn_circuit_ega_07d96(a, b, scan); scan += 4; }
}
void grp_9f28a0f5(unsigned int a, unsigned int b, unsigned char *scan, unsigned long *out) {
    unsigned int i = 0;
    while (*scan) { out[i++] = grp_f3a4e254(a, b, scan); scan += 4; }
}
void grp_e4004f71(unsigned int a, unsigned int b, unsigned char *scan, unsigned long *out) {
    unsigned int i = 0;
    while (*scan) { out[i++] = grp_f3a4e254(a, b, scan); scan += 4; }
}



