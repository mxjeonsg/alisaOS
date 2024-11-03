#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/std/string.hxx -> String related functions
*/

#include "string.hxx"
#include "std.cxx"


extern "C" const usize CStr::StringLength(const icstr string) {
    if(string == null) return 0;

    usize ctr = 0;

    for(ctr = 0; string[ctr] || string[ctr] != '\0'; ctr++) {
        if(string[ctr] == '\0') return ctr;
    }

    return ctr;
}

extern "C" const icstr CStr::IntegerToCStr(const i32 digit, const i32 base) {
    i32 i = 0, isNeg = 0;

    i8 str[11] = { 0 };
    const usize strlen = 11;
    i32 dig = digit;

    if(dig == 0) {
        str[i++] = '0';
        str[i] = '\0';

        return str;
    }

    if(digit < 0 && base == 10) {
        isNeg = 1;
        dig = -dig;
    }

    while(dig != 0) {
        i32 rem = (digit % base);
        str[i++] = (rem > 9) ? ((rem - 10) + 'a') : (rem + '0');
        dig /= base;
    }

    if(isNeg) str[i++] = '-';

    str[i] = '\0';

    CStr::StringReverse(str, strlen);

    return str;
}

extern "C" None CStr::StringReverse(icstr str, usize strlen) {
    if(str == null) return;

    strlen = strlen > 0 ? strlen : CStr::StringLength(str);

    i32 start = 0, end = (strlen - 1);

    while(start < end) {
        i8 tmp = str[start];
        str[start] = str[end];
        str[end] = tmp;
        start++; end--;
    }
}

extern "C" icstr CStr::StringDuplicateEx(const icstr str, const usize strlen, const i8*(*allocator)(const usize)) {
    if(str == 0) return "<StringDuplicate: fail>";

    static const usize sl = strlen <= 0 ? StringLength(str) : strlen;
    usize i = 0;

    i8 string[sl] = {0};

    for(i = 0; i <= sl; i++) {
        string[i] = str[i];
    }
    string[i] = 0;

    return string;
}