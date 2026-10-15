/* Cycles uses four far calls to the rectangle primitive. */
typedef int I16;
#define FAR far
#define RECTANGLE_EDGE_THICKNESS_PIXELS 1
extern void FAR sprite1_unknown2(I16 x, I16 y, I16 width, I16 height, I16 color);
void FAR sprite_1_unk4(I16 x1, I16 y1, I16 x2, I16 y2, I16 color)
{
    I16 width;
    I16 height;
    width = x2 - x1 + RECTANGLE_EDGE_THICKNESS_PIXELS;
    height = y2 - y1;
    if (width > 0) {
        sprite1_unknown2(x1, y1, width, RECTANGLE_EDGE_THICKNESS_PIXELS, color);
        sprite1_unknown2(x1, y2, width, RECTANGLE_EDGE_THICKNESS_PIXELS, color);
    }
    if (height > 0) {
        sprite1_unknown2(x1, y1, RECTANGLE_EDGE_THICKNESS_PIXELS, height, color);
        sprite1_unknown2(x2, y1, RECTANGLE_EDGE_THICKNESS_PIXELS, height, color);
    }
}
