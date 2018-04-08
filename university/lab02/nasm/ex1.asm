;nasm -f elf helloworld.asm
;ld -m elf_i386 ex1.asm -o ex1
section .data
msg db 'Hello Brave New World!?', 0Ah

section .text
global _start

_start:
    mov ebx, msg
    mov eax, ebx

nextchar:
    cmp byte [eax], 0
    jz finished 
    inc eax
    jmp nextchar

finished:    
    sub eax, ebx; sub ebx from eax
    mov edx, eax ;edx no = num bytes in msg string
    mov ecx, msg
    mov ebx, 1 ; write to stdout
    mov eax, 4 ;sys_write
    int 80h
    mov ebx, 0;return status on exit
    mov eax, 1 ;sys_exit
    int 80h ;interrupt
    
