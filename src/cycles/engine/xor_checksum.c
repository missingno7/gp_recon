int grp_925127fd(unsigned char near *bytes, unsigned count, unsigned char initial)
{
    unsigned char checksum = initial;
    while (count--)
        checksum ^= *bytes++;
    return (signed char)checksum;
}
