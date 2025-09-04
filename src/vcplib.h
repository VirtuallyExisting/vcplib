#ifndef VCPLIB_H
#define VCPLIB_H

#include <citro2d.h>

// This function initalizes everything that needs initalized
void vcplib_Init(void);

void vcplib_DrawImage(C2D_Image img, float x, float y, float scale);

void vcplib_DrawRect(float x, float y, float width, float height, C2D_Color32 color);

void vcplib_Deinit(void);

void vcplib_FrameBegin(void);

void vcplib_BeginTopScreen(void);

void vcplib_BeginBottomScreen(void);


void vcplib_FrameEnd(void);

#endif