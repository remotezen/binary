%include '../functions.asm'

section .text
global _start

_start:
  pop ecx ; first args is the number of command line args

;print args from the command line
nextArg:  
  cmp ecx, 0h
  jz noMoreArgs
  pop eax
  call sprintLF
  dec ecx
  jmp nextArg

noMoreArgs:
  call quit
