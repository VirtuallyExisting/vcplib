# vcplib (Virtually Cross Platform Library)
Library for making games across Nintendo Wii, 3DS, and DS

**Currently supported platforms:**
- Nintendo 3DS
- Wii

## Hey!
This is the **_3DS branch_**, if you are here for Wii or DS, go to their respective branches, if not, welcome!

## What is vcplib?
vcplib is a library attempting to use OTHER libraries to make cross-platform games easier across Wii, 3DS, and DS.

vcplib is not finished (at all) and I am still working on it, vcplib could become even easier to use than the libraries IT uses.

## What does vcplib use under the hood?

- 3DS: libctru and citro2d
- Wii: libogc and GRRLIB
- DS: libnds

# Installation
Installing vcplib is a pretty straightforward process.

First, go to the releases tab and download the .a and .h files from the latest release.

Second of all, go to one of these locations:

C:/devkitPro can be substituted for wherever you installed devkitPro.

(3DS is the only supported console at the moment.)
3DS: C:/devkitPro/libctru
Wii: C:/devkitPro/libogc

Go to the lib folder and place the .a in there.
Then go back out of the lib folder and go inside the include folder, place the .h in there.

(NOTE: If you are using Wii, go inside the Wii folder inside of the lib folder.)

Third, define the library in your makefile:

LIBS	:= -lvcplib

That line in your makefile has to start EXACTLY like that, otherwise your compiler will spit a boatload of errors in your face.

Then in your project put in this line at the top below all the other includes:
#include <vcplib.h>

See the wiki for functions, what they do, and how to create a few simple projects with vcplib.
