typedef struct Record {
    unsigned char prefix[6];
    unsigned char flags;
    unsigned char suffix;
} Record;
extern Record g_cir_8c8e[];
extern Record * volatile g_cir_8da6;
extern int grp_177cf142(Record *record);
int count_valid_records(void)
{
    register Record *record;
    register unsigned int count;
    record = g_cir_8c8e;
    count = 0;
    while (record <= g_cir_8da6) {
        if (record->flags & 0x83) {
            if (grp_177cf142(record) != -1)
                ++count;
        }
        ++record;
    }
    return count;
}
