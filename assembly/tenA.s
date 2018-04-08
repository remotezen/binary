
.data 

	HelloWorld:
		.asciz "Hello World!\n"

	HelloFunction:
		.asciz "Hello Function!\n"

.text 
	.globl main 

	.type MyFunction, @function

	MyFunction:	# String pointer and len to be added by caller 

			movl $4, %eax #write
			movl $1, %ebx #fd
			int $0x80 #kerenl interrupt
			ret 

  main:
		nop
		# Print the Hello World String 
		
		leal HelloWorld, %ecx #pointer to string
		movl $14, %edx  #######length of the string
		call MyFunction

		# Print Hello Function 

		leal HelloFunction, %ecx #pointer to string
		movl $17, %edx
		call MyFunction

		# Exit Routine 
		
	ExitCall:
		movl $1, %eax
		movl $0, %ebx 
		int $0x80 
