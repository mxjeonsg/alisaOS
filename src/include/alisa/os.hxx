#pragma once

#include "../types.h"

#include "../std/macros.h"

extern "C" {
namespace os {
    class SegmentDescriptor {
        private:
        u16 limit_lo;
        u16 base_lo;
        u16 base_hi;
        u16 type;
        u16 flags_limit_hi;
        u16 base_vhi;

        public:
        SegmentDescriptor(const u32 base, const u32 limit, const u8 type);

        const u32 base(None), limit(None);
    } __attribute__((packed));

    class GlobalDescriptorTable {
        public:
        SegmentDescriptor
        nullSegmentSel,
        unusedSegmentSel,
        codeSegmentSel,
        dataSegmentSel;

        public:
        GlobalDescriptorTable(None);
        ~GlobalDescriptorTable(None);

        const u16
        code_segment_sel(None),
        data_segment_sel(None);
    };

    __usesAssemblyInl None disableInterrupts(const u1 are_you_sure);

    None encodeGdtEntry(u8* target, v0 source);
}
}