;; Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: loader64.asm -> Protected long (64 bit) mode preamble
;; Description: Preamble to step up to C++/C programming lol


global longmode_start

extern kernel_main


section .text
bits 64

longmode_start:
    mov ax, 0
    mov ss, ax
    mov ds, ax
    mov es, ax
    mov fs, ax
    mov gs, ax

    mov dword[0xb8000], 0x2f4b2f4f
    cli
    call kernel_main
    cli
    hlt