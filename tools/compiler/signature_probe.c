/*
 * Small, deterministic compiler-signature probe for the historical DOS toolchain.
 * This is a compiler experiment, not reconstructed game source.
 */
int clamp8(int value)
{
    if (value < 0)
        return 0;
    if (value > 255)
        return 255;
    return value;
}
