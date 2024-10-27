CXX=/opt/x86_64-elf-tools/bin/x86_64-elf-g++
LD=/opt/x86_64-elf-tools/bin/x86_64-elf-ld
AS=/opt/x86_64-elf-tools/bin/x86_64-elf-as
NASM=nasm

QEMU=/mnt/c/msys64/ucrt64/bin/qemu-system-x86_64.exe

CXXSHUTUP=-Wno-write-strings
CXXPARAM=$(CXXSHUTUP) -c -fno-use-cxa-atexit -nostdlib -fno-builtin -fno-rtti -fno-exceptions -fno-leading-underscore -fno-threadsafe-statics -nostdlib -ffreestanding
ASPARAMS=--32
LDPARAMS=-n -T src/linker.ld
NASMPARAMS=-felf64

QEMUPARAMS=-m 2G

IN_ASM_FILES=src/header.asm src/loader.asm src/loader64.asm src/secret.asm
IN_OBJ_FILES=build/loader.o build/header.o build/loader64.o build/secret.o
IN_CXX_FILES=src/include/std/std.hxx src/include/std/std.cxx src/include/types.h src/kernel/kernel.cxx


all: low_priority high_priority

loader: $(IN_ASM_FILES)
	clear
	$(NASM) $(NASMPARAMS) -o build/header.o src/header.asm
	$(NASM) $(NASMPARAMS) -o build/loader.o src/loader.asm
	$(NASM) $(NASMPARAMS) -o build/loader64.o src/loader64.asm
	$(NASM) $(NASMPARAMS) -o build/secret.o src/secret.asm
	$(LD) $(LDPARAMS) -o build/loader.bin build/loader.o build/loader64.o build/header.o build/secret.o build/kernel.o

kernel: $(IN_CXX_FILES)
	clear
	$(CXX) $(CXXPARAM) -o build/kernel.o src/kernel/kernel.cxx

low_priority: kernel
high_priority: loader embedder

embedder:
	clear
	cp build/loader.bin build/iso/boot/alisaos.bin
	grub-mkrescue /usr/lib/grub/i386-pc -o build/alisa.iso build/iso

revert:
	rm -fr build/alisa.iso
	rm -r build/iso/boot/alisaos.bin
	rm -r build/*.bin
	rm -r build/*.o
	clear

regen_grubstrc:
	mkdir -p build/iso/boot/grub
	echo "set timeout=0\nset default=0\n\nmenuentry  \"alisaOS\" {\n    multiboot2 /boot/alisaos.bin\n    boot\n}" > build/iso/boot/grub/grub.cfg

preproc: src/kernel/kernel.cxx
	$(CXX) $(CXXPARAM) -E -o src/preproc.tmp.cxx src/kernel/kernel.cxx

run: build/alisa.iso
	$(QEMU) $(QEMUPARAMS) -cdrom build/alisa.iso