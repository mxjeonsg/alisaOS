/*
;;Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: linker.ld -> linker settings
;; Description: no
*/
ENTRY(uwu)


SECTIONS {
    . = 1M;

    .boot :
    {
        KEEP(*(.multiboot_header))
    }

    .text :
    {
        *(.text*)
    }

    /DISCARD/ :
    {
        *(.fini_array*)
        *(.comment)
    }
}