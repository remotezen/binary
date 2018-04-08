
MISMATCH: "data "

HelloWorldString: 
MISMATCH: "        .ascii "Hello World\n""

HelloWorldString.text: 

MISMATCH: ".globl _start "

_start: 
MISMATCH: "        # Load all the arguments for write () "

MISMATCH: "        movl $4, %eax"
MISMATCH: "        movl $1, %ebx"
MISMATCH: "        movl $HelloWorldString, %ecx"
MISMATCH: "        movl $12, %edx"
MISMATCH: "        int $0x80"

MISMATCH: "        # Need to exit the program "

MISMATCH: "        movl $1, %eax"
MISMATCH: "        movl $0, %ebx"
MISMATCH: "        int $0x80"

