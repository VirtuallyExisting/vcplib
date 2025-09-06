#include "vcplib.h"

void vcplib_Init(void) {
	// Basically useless but compatibility matters
	GRRLIB_Init();
}

void vcplib_DrawImage(GRRLIB_texImg img, float x, float y, float scale) {
	GRRLIB_DrawImg(x, y, img, 0, scale, scale, 0xFFFFFFFF);
}

void vcplib_DrawRect(float x, float y, float width, float height, u32 color) {
    GRRLIB_Rectangle(x, y, width, height, 0xFFFFFFF, true);
}

void vcplib_Deinit(void) {
	GRRLIB_Exit();
}

void vcplib_FrameBegin(void) {
    return 0;
}

void vcplib_BeginTopScreen(void) {
	return 0;
}

void vcplib_BeginBottomScreen(void) {
	return 0;
}


void vcplib_FrameEnd(void) {
    GRRLIB_Render();  // Render the frame buffer to the TV
}