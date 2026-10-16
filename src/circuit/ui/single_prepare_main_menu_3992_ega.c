extern int grp_3f05a1a6();
extern unsigned long fn_circuit_ega_0c97e();
extern int fn_circuit_ega_08cd8();
extern int fn_circuit_ega_09394();
extern int fn_circuit_ega_08c1d();
extern int fn_circuit_ega_09c18();
extern int fn_circuit_ega_078ea();
extern unsigned long grp_aa88d69b();
extern int fn_circuit_ega_03fa0();
extern int fn_circuit_ega_00534();
extern int grp_e507b43b();
extern int fn_circuit_ega_078d2();
extern int fn_circuit_ega_03fca();
extern int grp_3f4e2cf3();
extern int g_0033a, g_5f00;
extern unsigned long g_096b0, g_096ac, g_09c2e, g_09b12, g_09cc0;
extern char g_093de[], g_093e8[], g_093f0[];
int prepare_main_menu_3992(void) {
 struct { int pad, i, result; } v;
 g_0033a=1;
 grp_3f05a1a6(g_096b0);
 grp_3f05a1a6(g_096ac);
 g_09c2e=fn_circuit_ega_0c97e(320,200,15);
 fn_circuit_ega_08cd8(g_09c2e);
 fn_circuit_ega_09394(0);
 fn_circuit_ega_08cd8(g_09b12);
 for(v.i=0;v.i<4;v.i++){
  fn_circuit_ega_08c1d(1L);
  fn_circuit_ega_09c18(((int far *)g_09c2e)[0],((int far *)g_09c2e)[1],v.i);
  v.result=fn_circuit_ega_078ea();
  if(v.result==0x18) goto done;
 }
 g_09cc0=grp_aa88d69b(g_093de);
 fn_circuit_ega_03fa0(2);
 fn_circuit_ega_00534();
 g_5f00=10; g_0033a=0; v.result=grp_e507b43b();
 g_0033a=1; g_5f00=10; fn_circuit_ega_078d2();
 fn_circuit_ega_03fca(); g_0033a=0;
 grp_3f05a1a6(g_09cc0);
 done:
 grp_3f4e2cf3(g_09c2e);
 g_096ac=grp_aa88d69b(g_093e8);
 g_096b0=grp_aa88d69b(g_093f0);
 return v.result;
}
