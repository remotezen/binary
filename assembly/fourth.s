 #gcc -Wall test.S -m32 -o test

#/usr/include/asm/unistd_32.h
.data 

HelloWorldString:
	.ascii "Hello World\n"

.text 

.globl main 

main:
	# Load all the arguments for write () 

	movl $4, %eax #write system call
	movl $1, %ebx #file descriptor 
	movl $HelloWorldString, %ecx #actual string
	movl $12, %edx #length of string
	int $0x80 #invokes system calls

	# Need to exit the program 

	movl $1, %eax #write system call
	movl $0, %ebx #status value
	int $0x80     #int 80 this calls the system call
