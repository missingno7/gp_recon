char ascii_upper(char value) {
    if (value >= 'a' && value <= 'z') value -= 32;
    return value;
}
