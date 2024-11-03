#pragma once

#include "memalloc.hxx"
#include "std.cxx"
#include "string.cxx"

extern "C" {
    None KStd::MemoryAllocator::$zeroOut(None) {
        const usize steps = 512;

        for(u64 count = 0; count <= this->MAX_ALLOCATED_MEMORY; count += steps) {
            MemSetFrom(this->whole_thing, this->MAX_ALLOCATED_MEMORY, count, steps, 0);
        }
    }

    u1 KStd::MemoryAllocator::$askIfAvailable(const usize howmuch) {
        return this->allocated_memory + howmuch <= this->MAX_ALLOCATED_MEMORY ? u1::True : u1::False;
    }

    KStd::MemoryAllocator::MemoryAllocator() {
        this->$zeroOut();

        this->started = u1::True;

        KStd::ScrPrint("[.]MemoryAllocator: Allocated ", 0);
        KStd::ScrPrint(CStr::IntegerToCStr(this->MAX_ALLOCATED_MEMORY, 10), 0);
        KStd::ScrPrintln(".", 0);
    }

    KStd::MemoryAllocator::~MemoryAllocator() {
        this->$zeroOut();
    }

    i8* KStd::MemoryAllocator::allocate_i8(const usize how_much) {
        if(how_much == 0) {
            // Return one
            this->allocated_memory += sizeof(i8);
            return cast(&this->whole_thing[this->cursor++], i8*);
        } else {
            const usize asked = sizeof(i8) * how_much;

            if(this->$askIfAvailable(asked)) {
                this->allocated_memory += asked;
                return cast(&this->whole_thing[this->cursor++], i8*);
            } else {
                ScrPrintln("[!] MemoryAllocator: Out of memory.", 0);
                return null;
            }
        }
    }
}

None KStd::MemoryAllocator::dump(None) {
    ScrPrintln("Dumping allocated memory: ", 0);

    for(usize i = 0; i <= this->allocated_memory - 1; i++) {
        KStd::ScrPrintc(this->whole_thing[i]);
    }

    KStd::ScrNewline();
}