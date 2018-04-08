;nasm -f elf32 hello.asm 
;#include <stdio.h>
;int main() {
;  puts("Hello world!");
;  return 0;
;}
;objdump -M intel -d hello.o
;ld -s -lc -m elf_i386 -dynamic-linker /lib/ld-linux.so.2 -e main hello.o -o hello_min
; -e tells linker where the entry ie: main


;    eax contains the syscall ID
;    parameters are passed in ebx, ecx, edx, esi, edi, ebp (in this order)
;    return values are placed in eax (where available)
;    the syscall is responsible for saving and restoring all registers

extern puts
section .data
    helloStr: db 'Hello World?',0
section .text
    global main
main:
    push helloStr
    call puts

 ;objdump -M intel -r hello.o find puts from c library
