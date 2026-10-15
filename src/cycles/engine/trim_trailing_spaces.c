extern int grp_5ca87e84(char near *text);
void grp_740dd4f2(char near *text)
{
    int index;
    index = grp_5ca87e84(text) - 1;
    while (text[index] == ' ') {
        if (index < 0)
            break;
        text[index--] = 0;
    }
}
