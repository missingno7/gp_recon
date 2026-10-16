typedef short S16;
typedef unsigned short U16;
typedef unsigned long U32;
typedef U32 (far *EntryProc)(void);

typedef struct LoaderHeader {
    U16 word0;
    U16 word2;
    U16 word4;
    U16 word6;
    U16 min_alloc;
    U16 max_alloc;
    U16 word12;
    U16 word14;
    U16 word16;
    U16 word18;
    U16 entry_offset;
    U16 entry_segment;
    U16 word24;
    U16 word26;
} LoaderHeader;

typedef union CallAddress {
    U32 address;
    EntryProc entry;
    struct { U16 offset, segment; } words;
} CallAddress;

typedef union AllocationResult {
    U32 value;
    char far *pointer;
    struct { U16 offset, segment; } words;
} AllocationResult;

typedef struct LoaderFrame {
    unsigned char reserved[0x64];
    U16 allocation_bytes;
    U32 image_bytes;
    LoaderHeader header;
    U16 entry_segment;
    CallAddress call;
    U16 paragraphs;
    S16 file;
} LoaderFrame;

S16 far grp_181f4d04(char *);
char * far grp_58b11c1a(char *, char *, char *);
#pragma alloc_text(CYCLES_FILELOAD_TEXT, grp_181f4d04, grp_58b11c1a)

extern S16 far grp_69b75d8c(char *, char *);
extern S16 far grp_e747cf63(char *, U16, U16, S16);
extern void far grp_2e800973(S16);
extern U32 far grp_6a02d808(U16);
extern S16 far grp_31639679(char *, U16, U16);
extern char *strcpy(char *, char *);
extern char *strcat(char *, char *);
extern char *far FN_CYCLES_CGA_03A98(char *, S16);
#pragma intrinsic(strcpy, strcat)

extern AllocationResult g_08e66;
extern U16 g_08e68;
extern U32 g_cycle_service;
extern char G_FILE_META[];
extern char g_cga_a7a2[];

S16 far grp_181f4d04(char *filename)
{
    LoaderFrame frame;

    frame.call.address = 0UL;
    grp_58b11c1a((char *)&frame, filename, G_FILE_META);
    frame.file = grp_69b75d8c((char *)&frame, g_cga_a7a2);
    if (frame.file == 0)
        return 1;

    grp_e747cf63((char *)&frame.header, 0x1c, 1, frame.file);
    grp_2e800973(frame.file);

    frame.image_bytes = ((U32)frame.header.word4 << 9) +
                        frame.header.word2 - 0x200UL;
    frame.paragraphs = (U16)((frame.image_bytes >> 4) -
                              frame.header.min_alloc +
                              frame.header.max_alloc + 1);
    frame.allocation_bytes = frame.paragraphs << 4;
    g_08e66.value = grp_6a02d808(frame.allocation_bytes);
    if (g_08e66.value == 0)
        return 3;

    if (grp_31639679((char *)&frame, g_08e66.words.offset, g_08e68) == 0) {
        frame.entry_segment = frame.header.entry_segment + g_08e68;
        frame.call.address = ((U32)frame.entry_segment << 16) +
                             frame.header.entry_offset;
        g_cycle_service = frame.call.entry();
        if (g_cycle_service != 0)
            return 0;
    }
    return 2;
}

char * far grp_58b11c1a(char *destination, char *source, char *extension)
{
    strcpy(destination, source);
    if (FN_CYCLES_CGA_03A98(source, '.') == 0)
        strcat(destination, extension);
    return destination;
}
