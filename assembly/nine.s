#JZ if zero flag is set
#JNZ if zero flag is not set 
#Conditinal jmp

.data 
	
	HelloWorld:
		.asciz "Hello World!\n"

	ZeroFlagSet:
		.asciz	"Zero Flag was Set!"

	ZeroFlagNotSet:
		.asciz  "Zero Flag Not Set!"


.text 

	.globl main 

	main:

		nop	
		movl $10, %eax
		xorl %eax, %eax #when applied to the same entity is zero set the ZF 
		jz PrintHelloWorld #is the zero flag set

	FlagNotSetPrint:
		movl $4, %eax
		movl $1, %ebx
		leal ZeroFlagNotSet, %ecx
		movl $19, %edx
		int $0x80 
		jmp ExitCall



	FlagSetPrint:
		movl $4, %eax
		movl $1, %ebx
		leal ZeroFlagSet, %ecx
		movl $19, %edx
		int $0x80 
		jmp ExitCall


	ExitCall:
		movl $1, %eax
		movl $0, %ebx
		int $0x80 

	PrintHelloWorld:
		movl $10, %ecx
		PrintTenTimes:
			pushl %ecx #save the value of ecx
			movl $4, %eax
			movl $1, %ebx
			leal HelloWorld, %ecx
			movl $14, %edx
			int $0x80
			popl %ecx #popl the value on the stack back into ecx
		loop PrintTenTimes # load value into ecx loop decrements ecx
		jmp ExitCall

