;using input
%include '../lib/functions.asm'

section .data
  msg1 db 'Please enter your name: ', 0h
  msg2 db 'Hello, ',  0h

section .bss
  sinput: resb 255

section .text
global _start

_start:
  mov eax, msg1
  call sprint
  mov edx, 255    ;number of bytes to read
  mov ecx, sinput ;buffer for user space
  mov ebx, 0      ;write to stdin
  mov eax, 3      ;kernel opcode 3 involke sys_read
  int 80h

  mov eax, msg2
  call sprint
  
  mov eax, sinput
  call sprint
  call quit
