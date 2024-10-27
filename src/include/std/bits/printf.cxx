#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/std/bits/printf.cxx -> printf implementation
;; Description: Hell this thig damn hurts...
*/

#include "../std.hxx"
#include "../string.cxx"


extern "C" {
None KStd::_impl_printf(const icstr format, ...) {
    const usize fmt_sz = CStr::StringLength(format);
    i32* argp = cast(format, i32*);

    for(usize i = 0; format[i] != '\0' || i <= fmt_sz; i++) {
        if(format[i] != '\'') {
            ScrPrintc(format[i]);
        }
    }
}
}