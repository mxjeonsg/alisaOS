#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/types.h -> Just type aliases
*/

extern "C" {
    typedef unsigned char u8, uchar, ubyte, *ucstr, umin;
    typedef char i8, ichar, ibyte, *icstr, imin;

    typedef unsigned short u16, ushort, uword;
    typedef short i16, ishort, iword;

    typedef unsigned int u32, uint, udword;
    typedef int i32, idword;
    
    typedef unsigned long long int u64, ulong, uqword, usize, umax, uptr;
    typedef long long int i64, ilong, iqword, isize, imax, iptr;

    typedef float f32;
    typedef double f64;

    typedef void* v0, *rawmem;

    typedef enum alisaOS_fakeType_bool {True=1, False=0} u1, i1, ubool, ibool, ubit, ibit;

    #define None void
    #define null 0
    #define cast(expr, new_type) (new_type) expr
}