section .data
    bufsize    resw 8192
section .bss
    filename resb 255
    buf resb 8192

section .text
    global main
main:
    pop ebx
    pop ebx
    mov eax,5
    mov ecx,0
    int 80h
    test eax,eax
    jns file_function
    mov ebx,eax
    mov eax,1
    int 80h
file_function:
    mov ebx,eax
    mov eax,3
    mov ecx,buf
    mov edx,bufsize
    int 80h
    js error
