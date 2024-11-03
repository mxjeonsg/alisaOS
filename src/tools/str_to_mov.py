#!/usr/bin/python

import sys

def type_check(var: any, expected: type, msg: str) -> bool:
    if type(var) is not expected:
        raise TypeError(msg)
    else:
        return True

def process_str(input_str: str) -> str:
    type_check(input_str, str, "Provided argument is not a string while a string was expected.")

    result: str = ""
    ptr: int = 0xb8000

    for i in range(0, len(input_str), 2):
        pair: str = input_str[i:i + 2]
        dword: bool = False

        if len(pair) == 2:
            swapped: str = str('\x4f' + pair[1] + '\x4f' + pair[0])
            dword = True
        else:
            swapped: str = str('\x4f' + pair)
            dword = False
        
        hex_val: str = hex(int.from_bytes(swapped.encode(), "big"))

        if dword:
            result += f"mov dword[0x%x], %s\n" % (ptr, hex_val)
            ptr += 4
        else:
            result += f"mov word[0x%x], %s\n" % (ptr, hex_val)
            ptr += 2
    return result

if __name__ == "__main__":
    argv = sys.argv[1:]

    with open("./build/output.txt", "w+") as file:
        for arg in argv:
            file.write(f"----------String----------\n")
            file.write(f"String: %s\n" % (arg))
            file.write(process_str(arg))
            file.write(f"--------------------------\n\n")