#pragma once
/*
Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: include/macros.h -> Useful macros
*/

extern "C" {
    #define to_kb(qua) (1024 * qua)
    #define to_mb(qua) ((1024 * 1024) * qua)
    #define to_gb(qua) to_mb(1024 * qua)

    #define __usesAssemblyInl // Functions that use Assembly inside their bodies
    #define __usesAssemblyBites // Functions imported from Assembly bites

    #define ArraySize(arr) (sizeof(arr) / sizeof(arr[0]))
}