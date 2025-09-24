#include "vcplib.h"

void vcplib_Init(void) {
    // idk
    gfxInitDefault();
    // Initalize citro2d
	C3D_Init(C3D_DEFAULT_CMDBUF_SIZE);
	C2D_Init(C2D_DEFAULT_MAX_OBJECTS);
	C2D_Prepare();
}

void vcplib_DrawImage(C2D_Image img, float x, float y, float scalex, float scaley) {
    C2D_DrawImageAt(img, x, y, 0, NULL, scalex, scaley);
}

void vcplib_DrawRect(float x, float y, float width, float height, u32 color) {
    C2D_DrawRectSolid(x, y, 0, width, height, color);
}

void vcplib_Deinit(void) {
    C2D_Fini();
	C3D_Fini();
	gfxExit();
}

void vcplib_FrameBegin(void) {
    C3D_FrameBegin(C3D_FRAME_SYNCDRAW);
}

void vcplib_BeginTopScreen(void) {
		// Create render target for top screen
		u32 vcplibclearcolor = C2D_Color32(0x00, 0x00, 0x00, 0x00);
		C3D_RenderTarget* top = C2D_CreateScreenTarget(GFX_TOP, GFX_LEFT);
    	C2D_TargetClear(top, vcplibclearcolor);
		C2D_SceneBegin(top);
}

void vcplib_BeginBottomScreen(void) {
		// Create render target for bottom screen
		u32 vcplibclearcolor = C2D_Color32(0x00, 0x00, 0x00, 0x00);
		C3D_RenderTarget* bottom = C2D_CreateScreenTarget(GFX_BOTTOM, GFX_LEFT);
    	C2D_TargetClear(bottom, vcplibclearcolor);
		C2D_SceneBegin(bottom);
}


void vcplib_FrameEnd(void) {
    C3D_FrameEnd(0);
}