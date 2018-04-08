#variableDemo.s
#gcc -ggdb -Wall -ggdb test.S -m32 -o test
.data
  HelloWorld:
    .ascii "Hello World!"
  ByteLocation:
    .byte 10
  int32:
    .int 2
  int16:
    .short 3
  Float:
    .float 10.23
  IntegerArray:
    .int 10,20,30,40,50
.bss
  .comm LargeBuffer, 10000
.text
  .globl main
  main:
  nop
  movl $1, %eax
  movl $0, %ebx
  int  $0x80
