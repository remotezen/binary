
 #gcc -Wall test.S -m32 -o test
 as -o justexit.o justexit.s
 ld -o justexit justexit.o
list of linux system calls
/usr/include/asm/unistd.h
eax system call number
ebx 1 arg
ecx 2 arg
edx 3 arg
esi 4 arg
edi 5 arg
####typical gas program
main:
	# Load all the arguments for write () 

	movl $4, %eax #write system call
	movl $1, %ebx 
	movl $HelloWorldString, %ecx
	movl $12, %edx #string length
	int $0x80 #invokes system calls

	# Need to exit the program 

	movl $1, %eax #file descriptor
	movl $0, %ebx #status value
	int $0x80 # call the system call 
  
