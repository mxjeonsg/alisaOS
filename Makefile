CXX=/mnt/c/x86_64-elf-tools/bin/x86_64-elf-g++.exe
LD=/mnt/c/x86_64-elf-tools/bin/x86_64-elf-ld.exe
AS=/mnt/c/x86_64-elf-tools/bin/x86_64-elf-as.exe
# NASM=/mnt/c/msys64/ucrt64/bin/nasm.exe
NASM=nasm

ARCH=x86_64
QEMU=/mnt/c/msys64/ucrt64/bin/qemu-system-$(ARCH).exe

CXXSHUTUP=-Wno-write-strings
CXXINCLUDES=-Isrc/include
CXXPARAM=$(CXXINCLUDES) $(CXXSHUTUP) -c -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -fno-threadsafe-statics -nostdlib -ffreestanding
ASPARAMS=--32
LDPARAMS=-n -T src/linker.ld
NASMPARAMS=-felf64

QEMUPARAMS=-m 2G

IN_ASM_FILES=src/header.asm src/loader.asm src/loader64.asm src/secret.asm
IN_OBJ_FILES=build/obj/loader.o build/obj/header.o build/obj/loader64.o build/obj/secret.o build/obj/bootldr.o
IN_CXX_FILES=src/include/std/std.hxx src/include/std/std.cxx src/include/types.h src/kernel/bootloader.cxx src/include/alisa/os.cxx


all: low_priority high_priority

loader: $(IN_ASM_FILES)
	clear
	mkdir -p build/obj
	$(NASM) $(NASMPARAMS) -o build/obj/header.o src/header.asm
	$(NASM) $(NASMPARAMS) -o build/obj/loader.o src/loader.asm
	$(NASM) $(NASMPARAMS) -o build/obj/loader64.o src/loader64.asm
	$(NASM) $(NASMPARAMS) -o build/obj/secret.o src/secret.asm
	$(LD) $(LDPARAMS) -o build/alisa.bin build/obj/loader.o build/obj/loader64.o build/obj/header.o build/obj/secret.o build/obj/bootldr.o

bootloader: $(IN_CXX_FILES)
	clear
	$(CXX) $(CXXPARAM) -o build/obj/bootldr.o src/kernel/bootloader.cxx

low_priority: bootloader
high_priority: loader embedder

embedder:
	clear
	cp build/alisa.bin build/iso/boot/alisaos.bin
	grub-mkrescue /usr/lib/grub/i386-pc -o build/alisa.iso build/iso

revert:
	rm -fr build/alisa.iso
	rm -r build/iso/boot/alisaos.bin
	rm -r build/*.bin
	rm -rf build/obj/*.o
	rm -rf build/*.o
	clear

regen_grubstrc:
	mkdir -p build/iso/boot/grub
	echo "set timeout=0\nset default=0\n\nmenuentry  \"alisaOS\" {\n    multiboot2 /boot/alisaos.bin\n    boot\n}" > build/iso/boot/grub/grub.cfg

preproc: src/kernel/bootloader.cxx
	$(CXX) $(CXXPARAM) -E -o src/preproc.tmp.cxx src/kernel/bootloader.cxx

asm: src/kernel/bootloader.cxx
	$(CXX) $(CXXPARAM) -O0 -S -o src/preproc.tmp.s src/kernel/bootloader.cxx

run: build/alisa.iso
	$(QEMU) $(QEMUPARAMS) -cdrom build/alisa.iso

