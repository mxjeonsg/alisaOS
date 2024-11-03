#pragma once

#include "./std.hxx"
#include "./macros.h"

extern "C" namespace KStd {
    class MemoryAllocator {
        public:
        // Maximum allocatable:
        // 1GB x
        // 100MB x
        // 20MB x
        // 10MB x
        // 1MB x
        static const u64 MAX_ALLOCATED_MEMORY = to_mb(1);
        const u8 MIN_ALLOC_CHUNKS = 32;
        u64 allocated_memory = 0;
        u64 cursor = 0;


        private:
        u1 started = u1::False;

        i8 whole_thing[MAX_ALLOCATED_MEMORY];

        None $zeroOut(None);
        u1 $askIfAvailable(const usize howmuch);


        public:
        MemoryAllocator();

        ~MemoryAllocator();

        public:
        // Because haha no C++ linkage
        u1* allocate_u1(const usize how_much);

        i8* allocate_i8(const usize how_much);
        u8* allocate_u8(const usize how_much);

        i16* allocate_i16(const usize how_much);
        u16* allocate_u16(const usize how_much);

        i32* allocate_i32(const usize how_much);
        u32* allocate_u32(const usize how_much);

        i64* allocate_i64(const usize how_much);
        u64* allocate_u64(const usize how_much);

        f32* allocate_f32(const usize how_much);
        f64* allocate_f64(const usize how_much);

        None dump(None);
    };
}