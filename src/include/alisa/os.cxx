#pragma once

#include "../types.h"

#include "../std/macros.h"

#include "os.hxx"

extern "C" {
    os::GlobalDescriptorTable::GlobalDescriptorTable(None):
        nullSegmentSel(0, 0, 0),
        unusedSegmentSel(0, 0, 0),
        codeSegmentSel(0, to_mb(64), 0x9a),
        dataSegmentSel(0, to_mb(64), 0x92)
    {
        u32 i[2] = { cast(this, u32), sizeof(GlobalDescriptorTable) << 16 };

        asm("lgdt (%0)" : :"p" (cast(i, u8*) + 2));
    }

    os::GlobalDescriptorTable::~GlobalDescriptorTable() {}

    const u16 os::GlobalDescriptorTable::data_segment_sel(None) {
        return cast(&this->dataSegmentSel - cast(this, u8*), u8*);
    }

    const u16 os::GlobalDescriptorTable::code_segment_sel(None) {
        return cast(&this->codeSegmentSel - cast(this, u8*), u8*);
    }

    os::SegmentDescriptor::SegmentDescriptor(const u32 base, const u32 limit, const u8 flags) {
        u32 lim = limit;

        u8* target = cast(this, u8*);

        if(limit <= 65536) {
            target[6] = 0x40;
        } else {
            if((limit & 0xfff) != 0xfff) {
                lim = (limit>>12) - 1;
            } else {
                lim = limit>>12;
            }

            target[6] = 0xc0;
        }

        target[0] = lim & 0xff;
        target[1] = (lim>>8) & 0xff;
        target[2] = base & 0xff;

        target[3] = (base>>8) & 0xff;
        target[4] = (base>>16) & 0xff;
        target[5] = flags;
        target[6] |= (limit>>16) & 0xf;

        target[7] = (base>>24) & 0xff;
    }

    const u32 os::SegmentDescriptor::base(None) {
        u8* target = cast(this, u8*);
        u32 result = target[7];

        result = (result<<8) + target[4];
        result = (result<<8) + target[3];
        result = (result<<8) + target[2];

        return result;
    }

    const u32 os::SegmentDescriptor::limit(None) {
        u8* target = cast(this, u8*);
        u32 result = target[6] & 0xf;

        result = (result<<8) + target[1];
        result = (result<<8) + target[0];

        if((target[6] & 0xc0) == 0xc0) {
            result = (result<<12) | 0xfff;
        }

        return result;
    }

    __usesAssemblyInl None disableInterrupts(const u1 are_you_sure) {
        if(are_you_sure) asm volatile("cli");
    }
}