extern void far set_state_word_08e76(void);
#pragma alloc_text(INIT_TABLE_TEXT, set_state_word_08e76)

extern unsigned int g_08e76;

void far set_state_word_08e76(void)
{
    g_08e76 = 1;
}
