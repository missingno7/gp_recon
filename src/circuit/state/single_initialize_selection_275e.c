extern unsigned char selection_state_a;
extern unsigned char selection_state_b;
extern int selection_mode;
extern int selection_delay;
extern int selection_state_c;
int init_selection_275e(unsigned char *options) {
    selection_state_a = 0;
    selection_state_b = 0;
    if (selection_mode == 1) {
        selection_state_a = 1;
        return 0;
    }
    *options |= 5;
    selection_delay = 0x190;
    selection_state_c = 1;
}
