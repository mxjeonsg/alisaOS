#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/std/std.cxx -> Standard library (for bootloader/kernel)
;; Description: Objects and declarations
*/


#include "std.hxx"
#include "string.cxx"

// Pula mea...
#include "bits/printf.cxx"

extern "C" {
const u8 KStd::ConstructColour(const u8 fg, const u8 bg) {
    return (fg | bg)<<4;
}

None KStd::ClearRow(const u64 row) {
    Char empty = {' ', 0xf|0x0<<4};

    for(u64 col = 0; col < Constant::COLUMMS; ++col) {
        Address::vbuff[col + Constant::COLUMMS * row] = empty;
    }
}

None KStd::ClearScr(None) {
    for(u64 i = 0; i < Constant::ROWS; ++i) {
        ClearRow(i);
    }
}

None KStd::ScrPrint(const icstr string, const usize strlen) {
    const usize len = strlen > 0 ? strlen : CStr::StringLength(string);

    for(usize i = 0; i <= len || string[i]; ++i) {
        if(string[i] == '\0') break;

        if(string[i] == '\n' || TermTrace::column++ > Constant::COLUMMS) {
            ScrNewline();
        }

        Address::vbuff[TermTrace::column + Constant::COLUMMS * TermTrace::row] = {
            .character = cast(string[i], u8),
            .colour = TermTrace::colour
        };
    }
}

None KStd::ScrPrintln(const icstr string, const usize strlen) {
    ScrPrint(string, strlen);
    ScrNewline();
}

None KStd::ScrNewline() {
    TermTrace::column = 0;

    if(TermTrace::row < Constant::ROWS - 1) {
        TermTrace::row++;
        return;
    }

    // Scroll up the screen if overflow
    for(usize row = 1; row < Constant::ROWS; row++) {
        for(usize col = 0; col < Constant::COLUMMS; col++) {
            Char current  = Address::vbuff[col + Constant::COLUMMS * row];
            Address::vbuff[col + Constant::COLUMMS * (row - 1)] = current;
        }
    }

    ClearRow(Constant::COLUMMS - 1);
}

const u8 KStd::ScrSetColour(const u8 fg, const u8 bg) {
    const u8 old_colour = TermTrace::colour;

    TermTrace::colour = fg + (bg<<4);

    return old_colour;
}

const u8 KStd::ScrSetColourU8(const u8 colour) {
    const u8 old_colour = TermTrace::colour;

    TermTrace::colour = colour;

    return old_colour;
}

None KStd::halt(None) {
    asm volatile(
        "cli" "\n" // Stops receving any orders
        "hlt" // Halts processor
    );
}

None KStd::ScrPrintc(const u8 character) {
    if(character == '\n' || TermTrace::column++ > Constant::COLUMMS) {
        ScrNewline();
    }

    Address::vbuff[TermTrace::column + Constant::COLUMMS * TermTrace::row] = {
        .character = cast(character, u8),
        .colour = TermTrace::colour
    };
}
}