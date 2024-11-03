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

    KStd::MemoryAllocator memalloc;

    i8* owo = memalloc.allocate_i8(1);
    i8* uwu = memalloc.allocate_i8(1);
    i8* qwq = memalloc.allocate_i8(1);
    *owo = 34; *uwu = 35; *qwq = *owo + *uwu;
    if(*qwq == 69) KStd::ScrPrintln("True", 0);

    const icstr str = "Putas y moet";
    const usize strlen = CStr::StringLength(str);
    
    i8* sexito = CStr::StringDuplicateEx("Sexito", 0, 0);
    KStd::ScrPrintln(sexito, 0);

    memalloc.dump();

    // Set up user input

    // Set up disk usage

    // I got 2GB of RAM but i can only use 1MB? xdd
}
}