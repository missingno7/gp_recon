typedef unsigned short U16;
typedef struct { char far *pixels; } ScreenData;
typedef ScreenData far *Screen;
typedef struct {
    U16 state;
    Screen picture1;
    Screen picture2;
    char buffer2[24];
    char buffer1[52];
} LocalFrame;
extern char far g_c7d4[];
extern Screen fn_circuit_ega_0c97e(U16,U16,U16);
extern void fn_circuit_ega_0ddfe(char *);
extern void fn_circuit_ega_08ca6(char *);
extern void fn_circuit_ega_08cd8(Screen);
extern void fn_circuit_ega_0c5be(U16,U16,U16,U16,U16,U16);
extern void fn_circuit_ega_09394(U16);
extern void fn_circuit_ega_08c84(U16,U16);
extern void fn_circuit_ega_0698c(U16,U16,U16,U16,U16);
extern void fn_circuit_ega_068d8(U16,U16);
extern void fn_circuit_ega_0b184(char far *,U16,U16);
extern U16 fn_circuit_ega_078ca(void);
extern void fn_circuit_ega_078b9(U16);
extern U16 fn_circuit_ega_078d2(void);
extern U16 fn_circuit_ega_068be(U16);
extern void fn_circuit_ega_0776f(void);
extern void fn_circuit_ega_06ffe(void);
extern void fn_circuit_ega_072fc(void);
extern void fn_circuit_ega_0e18e(U16);
extern void fn_circuit_ega_08cbf(char *);
extern void fn_circuit_ega_0de26(char *);
extern void fn_circuit_ega_08b26(Screen);
void grp_d1ec52d7(void)
{
    LocalFrame local;
    local.picture1 = fn_circuit_ega_0c97e(0xa0, 0x18, 0x0f);
    local.picture2 = fn_circuit_ega_0c97e(0xa0, 0x18, 0x0f);
    fn_circuit_ega_0ddfe(local.buffer1);
    fn_circuit_ega_08ca6(local.buffer2);
    fn_circuit_ega_08cd8(local.picture1);
    fn_circuit_ega_0c5be(0x50, 0x58, 0, 0, 0xa0, 0x18);
    fn_circuit_ega_08cd8(local.picture2);
    fn_circuit_ega_09394(0);
    fn_circuit_ega_0698c(4, 4, 0x9b, 0x14, 4);
    fn_circuit_ega_08c84(0x0f, 0);
    fn_circuit_ega_068d8(0x950e, 9);
    fn_circuit_ega_08cd8(g_c7d4);
    fn_circuit_ega_0b184(local.picture2->pixels, 0x50, 0x58);
    local.state = fn_circuit_ega_078ca();
    fn_circuit_ega_078b9(0x78a5);
    if (fn_circuit_ega_068be(fn_circuit_ega_078d2()) == 0x59) {
        fn_circuit_ega_0776f();
        fn_circuit_ega_06ffe();
        fn_circuit_ega_072fc();
        fn_circuit_ega_0e18e(0);
        return;
    }
    fn_circuit_ega_078b9(local.state);
    fn_circuit_ega_0b184(local.picture1->pixels, 0x50, 0x58);
    fn_circuit_ega_08cbf(local.buffer2);
    fn_circuit_ega_0de26(local.buffer1);
    fn_circuit_ega_08b26(local.picture2);
    fn_circuit_ega_08b26(local.picture1);
}
