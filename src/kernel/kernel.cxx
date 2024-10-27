/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: kernel.cxx -> Kernel Entrypoint
;; Description: Kernel mainfile
*/

#include "../include/std/std.cxx"

extern "C" {
None kernel_main(None) {
    u8 old_colour = 0;

    KStd::ClearScr();

    KStd::ScrPrintln("------------------------------", 30);
    old_colour = KStd::ScrSetColour(KStd::TermColour::ColourMagenta, KStd::ColourBlack);
    KStd::ScrPrintln("    AlisaOS Boot Manager", 0);
    KStd::ScrSetColourU8(old_colour);
    KStd::ScrPrintln("------------------------------", 30);
    KStd::ScrNewline();
    KStd::ScrNewline();
    KStd::ScrNewline();
}
}