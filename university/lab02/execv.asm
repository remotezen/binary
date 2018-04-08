extern execve
section .data ;for constants
section .bss
    filename resb 255
section .text
    global main
main:
    pop ebx
    pop ebx
    leave
    ret
    

    
