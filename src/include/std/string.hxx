#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/std/string.hxx -> String related functions
*/

#include "../types.h"

extern "C" {
    class Str {
        private:
        u8* data = null;
        usize length = 0;
        usize allocated = 0;
        const u8 delimitors[2] = { '\x2', '\x3'};

        public:
        Str(const i8* string) {

        }
    };

    namespace CStr {
        const usize StringLength(const icstr string);
        const icstr IntegerToCStr(const i32 digit, const i32 base);
        None StringReverse(icstr str, usize strlen);
        extern "C" icstr StringDuplicateEx(const icstr str, const usize strlen, const i8*(*allocator)(const usize));
    }
}