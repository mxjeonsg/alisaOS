section .multiboot_header
header_start:
    dd 0xe85250d6 ;; multiboot2
    dd 0 ;; arch: i386 protected
    dd (header_end - header_start) ;; header length
    dd 0x100000000 - (0xe85250d6 + 0 + (header_end - header_start)) ;; checksum

    ;; end tag
    dw 0
    dw 0
    dd 8

header_end: