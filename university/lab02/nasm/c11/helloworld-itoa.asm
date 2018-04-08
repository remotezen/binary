;nasm -f elf helloworld.asm
;ld -m elf_i386 ex1.asm -o ex1
%include '../lib/functions.asm'

section .text
global _start
_start:
  mov ecx, 0

nextNumber:
  inc ecx
  mov eax, ecx
  call iprintLF
  cmp ecx,10
  call quit
