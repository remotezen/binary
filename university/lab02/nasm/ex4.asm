section .data
msg db 'Hello, brave new world?', 0Ah

section .text
global _start

_start:
    mov eax, msg ;move the address of our msg
    call strlen
    mov edx, eax
    mov ecx, msg
    mov ebx, 1 ;fd stdout
    mov eax, 4 ;write it sys_call
    int 80h
    
    mov ebx, 0 ;status code
    mov eax, 1 ; sys_exit
    int 80h

strlen:
    push ebx ; push the value in EBX onto the stack to preserve it while we use EBX in this function
    mov ebx, eax

nextchar:
    cmp byte[eax],0
    jz finished
    inc eax
    jmp nextchar

finished:
    sub eax, ebx
    pop ebx
    ret
    
