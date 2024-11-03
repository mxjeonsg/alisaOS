#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/std/std.hxx -> Standard library (for bootloader/kernel)
;; Description: Objects and declarations
*/

#include "../types.h"
#include "macros.h"


extern "C" {
namespace KStd {
    typedef struct alisaOS_struct_charrepl {
        u8 character;
        u8 colour;
    } Char;

    namespace Constant {
        const u64 ROWS = 25, COLUMMS = 80;
    }

    namespace Address {
        v0 video_buffer = cast(0xb8000, v0);
        Char* vbuff = cast(0xb8000, Char*);
    }

    namespace TermTrace {
        u64 column = 0, row = 0;
        u8 colour = (0x0 | 0xf)<<4;
    }

    // I really wanna kms
    None _impl_printf(const icstr format, ...);

    // Terminal colours
    // Type: `typedef enum alisaOS_enum_termcolour: u8 {} TermColour`
    typedef enum alisaOS_enum_termcolour: u8 {
        ColourBlack      = 0x0,
        ColourBlue       = 0x1,
        ColourGreen      = 0x2,
        ColourCyan       = 0x3,
        ColourRed        = 0x4,
        ColourMagenta    = 0x5,
        ColourBrown      = 0x6,
        ColourLightGray  = 0x7,
        ColourDarkGray   = 0x8,
        ColourLightBlue  = 0x9,
        ColourLightGreen = 0xa,
        ColourLightCyan  = 0xb,
        ColourLightRed   = 0xc,
        ColourPink       = 0xd,
        ColourYellow     = 0xe,
        ColourWhite      = 0xf,
    } TermColour;

    const u8 ConstructColour(const u8 fg, const u8 bg);

    // This clears a row
    // In:
    // -`const u64 row` The row index
    // Out: nothing
    None ClearRow(const u64 row);

    // This clears the screen
    // In: nothing
    // Out: nothing
    None ClearScr(None);

    // This does a newline
    // In: nothing
    // Out: nothing
    None ScrNewline(None);

    // This prints a string to screen
    // In:
    // - `const icstr string`
    // - `const usize strlen`
    // Out: nothing
    None ScrPrint(const icstr string, const usize strlen);

    // This changes the pixel's colour foreground and background
    // In:
    // - `const u8 foreground` -> Pixel's foreground
    // - `const u8 background` -> Pixel's background
    // Out: `const u8` -> Colour set before changing
    const u8 ScrSetColour(const u8 fg, const u8 bg);

    // This changes the pixel's colour foreground and background
    // but from a u8 instead.
    // In:
    // - `const u8 foreground` -> Pixel's foreground
    // - `const u8 background` -> Pixel's background
    // Out: `const u8` -> Colour set before changing
    const u8 ScrSetColourU8(const u8 colour);

    // `KStd::ScrPrint` but prints a newline
    // In:
    // - `const icstr string`
    // - `const usize strlen`
    // Out: nothing
    None ScrPrintln(const icstr string, const usize strlen);

    // Print a single character
    // In:
    // - `const u8 character` -> Character to print
    // Out: nothing
    None ScrPrintc(const u8 character);

    // This completely aborts the bootloader/kernel
    // In: nothing
    // Out: nothing
    __usesAssemblyInl None halt(None);

    // This sets `ptr` chunk from zero to `qua`th
    // with `with`s.
    // In:
    // - `i8* ptr` -> The array pointer
    // - `const usize arrsz` -> The array size
    // - `const usize qua` -> How much bytes to fill
    // - `const i8 with` -> Fill with?
    // Out: `const usize` -> How much got filled
    const usize MemSet(i8* ptr, const usize arrsz, const usize qua, const i8 with);

    // This sets `ptr` chunk from `from` to `qua`th
    // with `with`s.
    // In:
    // - `i8* ptr` -> The array pointer
    // - `const usize arrsz` -> The array size
    // - `const usize from` -> Where to start
    // - `const usize qua` -> How much bytes to fill
    // - `const i8 with` -> Fill with?
    // Out: `const usize` -> How much got filled
    const usize MemSetFrom(i8* ptr, const usize arrsz, const usize from, const usize qua, const i8 with);
}
}