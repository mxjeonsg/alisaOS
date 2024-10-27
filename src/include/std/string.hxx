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
    namespace CStr {
        const usize StringLength(const icstr string);
    }
}