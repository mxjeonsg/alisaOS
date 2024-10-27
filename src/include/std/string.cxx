#pragma once
#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/std/string.hxx -> String related functions
*/

#include "string.hxx"

const usize CStr::StringLength(const icstr string) {
    if(string == null) return 0;

    usize ctr = 0;

    for(ctr = 0; string[ctr] || string[ctr] != '\0'; ctr++) {
        if(string[ctr] == '\0') return ctr;
    }

    return ctr;
}