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

;; This is done today, revert this
;;.set MAGIC, 0x1badb002
;;.set FLAGS, (1<<0 | 1<<1)
;;.set CHECKSUM, -(MAGIC + FLAGS)

section .multiboot
align 4
    ;;.long 0x1badb002
    ;;.long (1<<0 | 1<<1)
    ;;.long -(MAGIC + FLAGS)
    dd 0x1badb002
    dd (1<<0 | 1<<1)
    dd -(0x1badb002 + (1<<0 | 1<<1))
;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;;


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
    mov eax, cr0
    or eax, 0x80000000
    mov cr0, eax
    
    jmp gdt64.code_segment:longmode_start

is_multiboot_uwu:
    cmp eax, 0x36d76289
    jne .multiboot_not_uwu
    ret

    .multiboot_not_uwu:
        ;; Error: multiboot error. Couldn't find header.
        mov dword[0xb8000], 0x4f724f45
        mov dword[0xb8004], 0x4f6f4f72

        mov dword[0xb8008], 0x4f3a4f72
        mov dword[0xb800c], 0x4f6d4f20
        
        mov dword[0xb8010], 0x4f6c4f75
        mov dword[0xb8014], 0x4f694f74
        
        mov dword[0xb8018], 0x4f6f4f62
        mov dword[0xb801c], 0x4f744f6f
        
        mov dword[0xb8020], 0x4f654f20
        mov dword[0xb8024], 0x4f724f72
        
        mov dword[0xb8028], 0x4f724f6f
        mov dword[0xb802c], 0x4f204f2e
        
        mov dword[0xb8030], 0x4f6f4f43
        mov dword[0xb8034], 0x4f6c4f75
        
        mov dword[0xb8038], 0x4f6e4f64
        mov dword[0xb803c], 0x4f744f27
        
        mov dword[0xb8040], 0x4f664f20
        mov dword[0xb8044], 0x4f6e4f69
        
        mov dword[0xb8048], 0x4f204f64
        mov dword[0xb804c], 0x4f654f68
        
        mov dword[0xb8050], 0x4f644f61
        mov dword[0xb8054], 0x4f724f65
        
        mov word[0xb8058], 0x4f2e

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
        ;; Error: CPUid instruction failed.
        mov dword[0xb8000], 0x4f724f45
        mov dword[0xb8004], 0x4f6f4f72
       
        mov dword[0xb8008], 0x4f3a4f72
        mov dword[0xb800c], 0x4f434f20
       
        mov dword[0xb8010], 0x4f554f50
        mov dword[0xb8014], 0x4f644f69
       
        mov dword[0xb8018], 0x4f694f20
        mov dword[0xb801c], 0x4f734f6e
       
        mov dword[0xb8020], 0x4f724f74
        mov dword[0xb8024], 0x4f634f75
       
        mov dword[0xb8028], 0x4f694f74
        mov dword[0xb802c], 0x4f6e4f6f
       
        mov dword[0xb8030], 0x4f664f20
        mov dword[0xb8034], 0x4f694f61
       
        mov dword[0xb8038], 0x4f654f6c
        mov dword[0xb803c], 0x4f2e4f64
       
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
        ;; Error: long mode (64 bit) failed. Maybe the processor is not 64 bit?
        mov dword[0xb8000], 0x4f724f45
        mov dword[0xb8004], 0x4f6f4f72
        
        mov dword[0xb8008], 0x4f3a4f72
        mov dword[0xb800c], 0x4f6c4f20
        
        mov dword[0xb8010], 0x4f6e4f6f
        mov dword[0xb8014], 0x4f204f67
        
        mov dword[0xb8018], 0x4f6f4f6d
        mov dword[0xb801c], 0x4f654f64
        
        mov dword[0xb8020], 0x4f284f20
        mov dword[0xb8024], 0x4f344f36
        
        mov dword[0xb8028], 0x4f624f20
        mov dword[0xb802c], 0x4f744f69
        
        mov dword[0xb8030], 0x4f204f29
        mov dword[0xb8034], 0x4f614f66
        
        mov dword[0xb8038], 0x4f6c4f69
        mov dword[0xb803c], 0x4f644f65
        
        mov dword[0xb8040], 0x4f204f2e
        mov dword[0xb8044], 0x4f614f4d
        
        mov dword[0xb8048], 0x4f624f79
        mov dword[0xb804c], 0x4f204f65
        
        mov dword[0xb8050], 0x4f684f74
        mov dword[0xb8054], 0x4f204f65
        
        mov dword[0xb8058], 0x4f724f70
        mov dword[0xb805c], 0x4f634f6f
        
        mov dword[0xb8060], 0x4f734f65
        mov dword[0xb8064], 0x4f6f4f73
        
        mov dword[0xb8068], 0x4f204f72
        mov dword[0xb806c], 0x4f734f69
        
        mov dword[0xb8070], 0x4f6e4f20
        mov dword[0xb8074], 0x4f744f6f
        
        mov dword[0xb8078], 0x4f364f20
        mov dword[0xb807c], 0x4f204f34
        
        mov dword[0xb8080], 0x4f694f62
        mov dword[0xb8084], 0x4f3f4f74
        
        mov al, "L"
        jmp exc

exc:
    mov dword[0xb8090], 0x4f524f45
    mov dword[0xb8094], 0x4f3a4f52
    mov dword[0xb8098], 0x4f204f20
    mov byte[0xb809a], al
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