typedef unsigned short U16;
typedef unsigned long U32;

extern U32 far grp_7a614cef(U16, U16, unsigned char *);

void far cycles_map_token_list(U16 first, U16 second,
                               unsigned char *tokens, U32 *output);
#pragma alloc_text(CYCLES_TOKEN_MAP_TEXT, cycles_map_token_list)

void far cycles_map_token_list(U16 first, U16 second,
                               unsigned char *tokens, U32 *output)
{
    U16 index = 0;

    while (*tokens != 0) {
        output[index++] = grp_7a614cef(first, second, tokens);
        tokens += 4;
    }
}

extern U32 far fn_cycles_ega_068b6(U16, U16, unsigned char *);

void far cycles_map_token_list_alt(U16 first, U16 second,
                                   unsigned char *tokens, U32 *output);
#pragma alloc_text(CYCLES_TOKEN_MAP_TEXT, cycles_map_token_list_alt)

void far cycles_map_token_list_alt(U16 first, U16 second,
                                   unsigned char *tokens, U32 *output)
{
    U16 index = 0;

    while (*tokens != 0) {
        output[index++] = fn_cycles_ega_068b6(first, second, tokens);
        tokens += 4;
    }
}

void far cycles_map_token_list_dup(U16 first, U16 second,
                                   unsigned char *tokens, U32 *output);
#pragma alloc_text(CYCLES_TOKEN_MAP_TEXT, cycles_map_token_list_dup)

void far cycles_map_token_list_dup(U16 first, U16 second,
                                   unsigned char *tokens, U32 *output)
{
    U16 index = 0;

    while (*tokens != 0) {
        output[index++] = grp_7a614cef(first, second, tokens);
        tokens += 4;
    }
}

void far cycles_map_token_list_alt_dup(U16 first, U16 second,
                                       unsigned char *tokens, U32 *output);
#pragma alloc_text(CYCLES_TOKEN_MAP_TEXT, cycles_map_token_list_alt_dup)

void far cycles_map_token_list_alt_dup(U16 first, U16 second,
                                       unsigned char *tokens, U32 *output)
{
    U16 index = 0;

    while (*tokens != 0) {
        output[index++] = fn_cycles_ega_068b6(first, second, tokens);
        tokens += 4;
    }
}
