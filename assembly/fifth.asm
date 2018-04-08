MISMATCH: "#variableDemo.s"
.data: 
  HelloWorld: 
MISMATCH: "    .ascii "Hello World!""
  ByteLocation: 
MISMATCH: "    .byte 10"
  int32: 
MISMATCH: "    .int 2"
  int16: 
MISMATCH: "    .short 3"
  Float: 
MISMATCH: "    .float 10.23"
  IntegerArray: 
MISMATCH: "    .int 10,20,30,40,50"
IntegerArray.bss: 
MISMATCH: "  .comm LargeBuffer, 1000"
IntegerArray.text: 
MISMATCH: "  .globl main"
  main: 
  nop
MISMATCH: "  movl $1, %eax"
MISMATCH: "  movl $0, %ebx"
MISMATCH: "  int  $0x80"

