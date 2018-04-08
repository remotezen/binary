.data 

	HelloWorld:
		.asciz "Hello World!\n"

.text 

	.globl main 
	.type PrintFunction, @function

	PrintFunction:
		
		pushl %ebp  # store the current value of EBP on the stack 
		movl %esp, %ebp # Make EBP point to top of stack 
		
		# The write function 

		movl $4, %eax #write syscall
		movl $1, %ebx #fd stdout
		movl 8(%ebp), %ecx #string pointer src dest
		movl 12(%ebp), %edx #length 4bytes 
		int $0x80 #interupt

		movl %ebp, %esp # Restore the old value of ESP
		popl %ebp # Restore the old value of EBP 
		ret  # change EIP to start the next instruction 
  main:

		nop
		
		# push the strlen on the stack 
		pushl $13 
		# push the string pointer on the stack
		pushl $HelloWorld
		# Call the function 
		call PrintFunction

		# adjust the stack pointer 
		addl $8, %esp #-->2 4byte variables were added to the stack
                  #we want the stack before in it's before the call
                  #this is the ret function

		# Exit Routine 

		ExitCall:

			movl $1, %eax
			int $0x80

