;; Samir Rodriguez (ndivinity)|(Divinity Winter, Jeon) <mxjeonsgw@gmail.com>
;; The Alisa Operating System Project
;; -- ( Saturday, October 26th, 2024 | 4:41pm [Mexico Central Time])
;;
;; File: loader.asm -> Protected 32-bit mode preamble
;; Description: This prepares the run flow to jump to 64 bit mode,
;;              and potentially use C++/C now, because
;;              as much as I love assembly, it's becoming
;;              hard to stare at in VCS, I want real
;;              syntax hightlighting.


extern longmode_start

global uwu
global is_multiboot_uwu
global is_cpuid_uwu
global is_longmode_uwu

global exc

global exc_multiboot
global exc_cpuid
global exc_longmode

section .text
bits 32
uwu:
    mov esp, stack_top

    call is_multiboot_uwu
    call is_cpuid_uwu
    call is_longmode_uwu

    call set_pagetables_uwuable
    call make_pagetables_uwu

    lgdt [gdt64.ptr]
    jmp gdt64.code_segment:longmode_start

is_multiboot_uwu:
    cmp eax, 0x36d76289
    jne .multiboot_not_uwu
    ret

    .multiboot_not_uwu:
    mov al, "M"
    jmp exc

is_cpuid_uwu:
    pushfd
    pop eax
    mov ecx, eax
    xor eax, 1<<21
    push eax
    popfd
    pushfd
    pop eax
    push ecx
    popfd

    cmp eax, ecx
    je .cpuid_not_uwu
    ret

    .cpuid_not_uwu:
        mov al, "C"
        jmp exc

is_longmode_uwu:
    mov eax, 0x80000000
    cpuid

    cmp eax, 0x80000001
    jb .longmode_not_uwu

    mov eax, 0x80000001
    cpuid

    test edx, 1<<29
    jz .longmode_not_uwu

    ret

    .longmode_not_uwu:
        mov al, "L"
        jmp exc

exc:
    mov dword[0xb8000], 0x4f524f45
    mov dword[0xb8004], 0x4f3a4f52
    mov dword[0xb8008], 0x4f204f20
    mov byte[0xb800a], al
    hlt

set_pagetables_uwuable:
    mov eax, pagetable_l3
    or eax, 0b11 ;; ptbl present & writtable
    mov [pagetable_l4], eax

    mov eax, pagetable_l2
    or eax, 0b11 ;; ptbl present & writtable
    mov [pagetable_l3], eax

    mov ecx, 0 ;; counter

    .loop:
        mov eax, 0x200000
        mul ecx
        or eax, 0b10000011
        mov [pagetable_l2 + ecx * 8], eax

        inc ecx ;; increment counter
        cmp ecx, 512 ;; checks if table is mapped
        jne .loop ;; if not, continue

make_pagetables_uwu:
    mov eax, pagetable_l4
    mov cr3, eax

    ;; this for pae entension
    mov eax, cr4
    or eax, 1<<5
    mov cr4, eax

    mov ecx, 0xC0000080
    rdmsr
    or eax, 1<<8
    wrmsr

    mov eax, cr0
    or eax, 1<<31
    mov cr0, eax

    ret

section .bss
align 4096
pagetable_l4: resb 4096
pagetable_l3: resb 4096
pagetable_l2: resb 4096
pagetable_l1: resb 4096
stack_bottom: resb (4096 * 4)
stack_top:

section .rodata
gdt64:
    dq 0 ;; zero idx
    .code_segment: equ $ - gdt64
        dq (1<<43 | 1<<44 | 1<<47 | 1<<53) ;; code segment

    .ptr:
        dw $ - gdt64 - 1
        dq gdt64