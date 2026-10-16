extern void far clear_state_word_08e74(void);
#pragma alloc_text(INIT_TABLE_TEXT, clear_state_word_08e74)

extern unsigned int g_08e74;

void far clear_state_word_08e74(void)
{
    g_08e74 = 0;
}
