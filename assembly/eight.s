#uncondional branching
.data 

	HelloWorld:
		.asciz "Hello World!"

	CallDemo:
		.asciz "Call works!"

.text

	.globl main 
  

	main:
    nop
		call CallMe
    #jmp ExitProgram
    #echo $?
    #jmp changes the value of eip
    #call pushes the next statement after the call statement on to the stack

		# Write  HelloWorld 
    #short jump +/- 128 from the current instruction region
    #far   jump to a different segment

		movl $4, %eax
		movl $1, %ebx
		movl $HelloWorld, %ecx
		movl $12, %edx
		int $0x80



	
	ExitProgram:
		# Exit the program 
		movl $1, %eax
		movl $10, %ebx
		int $0x80 

	CallMe:
		movl $4, %eax
		movl $1, %ebx
		movl $CallDemo, %ecx
		movl $11, %edx
		int $0x80 
		ret 
