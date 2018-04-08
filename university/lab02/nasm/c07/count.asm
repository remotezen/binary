%include '../lib/functions.asm'

section .text
global _start

_start:

mov ecx, 0 ;initialized to zero

nextNumber:
  inc ecx ; increment ecx
  
  mov eax, ecx ;move the address of our integer into eax
  add eax, 48 ;add 48 to our number convert integer to ascii
  push eax
  mov eax, esp
  call sprintLF
  
  pop eax
  cmp ecx, 10
  jne nextNumber
  call quit
