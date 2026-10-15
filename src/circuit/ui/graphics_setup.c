typedef unsigned short U16;
typedef unsigned long U32;
typedef struct { char far *pixels; } ScreenData;
typedef ScreenData far *Screen;
typedef struct {
    U16 spare;
    Screen picture1;
    Screen picture2;
    char buffer2[24];
    char buffer1[52];
} LocalFrame;
extern char far g_c7d4[];
extern Screen fn_circuit_ega_0c97e(U16,U16,U16);
extern void fn_circuit_ega_0ddfe(char *);
extern void fn_circuit_ega_08ca6(char *);
extern void fn_circuit_ega_08cd8(char far *);
extern void fn_circuit_ega_0c5be(U16,U16,U16,U16,U16,U16);
extern void fn_circuit_ega_09394(U16);
extern void fn_circuit_ega_08c84(U16,U16);
extern void fn_circuit_ega_068d8(U16,U16);
extern void fn_circuit_ega_0b184(char far *,U16,U16);
extern void fn_circuit_ega_06897(U16,U16);
extern void fn_circuit_ega_08cbf(char *);
extern void fn_circuit_ega_0de26(char *);
extern void fn_circuit_ega_08b26(U32);
void grp_6b57b529(U16 p1, U16 p2, U16 p3)
{
    LocalFrame local;
    local.picture1 = fn_circuit_ega_0c97e(0x140, 10, 15);
    local.picture2 = fn_circuit_ega_0c97e(0x140, 10, 15);
    fn_circuit_ega_0ddfe(local.buffer1);
    fn_circuit_ega_08ca6(local.buffer2);
    fn_circuit_ega_08cd8((char far *)local.picture1);
    fn_circuit_ega_0c5be(0, 0xbe, 0, 0, 0x140, 10);
    fn_circuit_ega_08cd8((char far *)local.picture2);
    fn_circuit_ega_09394(0);
    fn_circuit_ega_08c84(15, 0);
    fn_circuit_ega_068d8(p1, 1);
    fn_circuit_ega_08cd8((char far *)g_c7d4);
    fn_circuit_ega_0b184(local.picture2->pixels, 0, 0xbe);
    fn_circuit_ega_06897(p2, p3);
    fn_circuit_ega_0b184(local.picture1->pixels, 0, 0xbe);
    fn_circuit_ega_08cbf(local.buffer2);
    fn_circuit_ega_0de26(local.buffer1);
    fn_circuit_ega_08b26((char far *)local.picture2);
    fn_circuit_ega_08b26((char far *)local.picture1);
}
