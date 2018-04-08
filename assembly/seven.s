#string is source esi is always edi
.data 
	HelloWorldString:
		.asciz "Hello World of Assembly!"
	H3110:
		.asciz "H3110"
.bss

	.lcomm Destination, 100
	.lcomm DestinationUsingRep, 100
	.lcomm DestinationUsingStos, 100

.text

	.globl main 

	main:
		nop 
		# 1. Simple copying using movsb, movsw, movsl

		movl $HelloWorldString, %esi #address of 
		movl $Destination, %edi #fill with memory location

		movsb #move byte into %edi these register are increments the number
		movsw #move word 16 bytes  bytes and the df flag is not set
		movsl #double word 32 bytes p /x $esi p /x $edi
		
		# 2. Setting / Clearing the DF flag 

		std # set the DF flag 
		cld # clear the DF flag 
	
		# 3. Using Rep 
		
		movl $HelloWorldString, %esi #move address of string
		movl $DestinationUsingRep, %edi #create storage
		movl $25, %ecx # set the string length in ECX
		cld # clear the DF make sure the flag is cleared
		rep movsb
		std 
		
		# 4. Loading string from memory into EAX register 
		
		cld 
		leal HelloWorldString, %esi #string memory must be in esi 
		lodsb #eax has an H in it
		movb $0, %al
		
		dec %esi
		lodsw
		movw $0, %ax #zero out eax 

		subl $2, %esi # Make ESI point back to the original string 
		lodsl 

		# 5. Storing strings from EAX to memory 
    #once again strings must be in eax edi must point to destination memory
    #edi incremented decrements base on df flag

		leal DestinationUsingStos, %edi #100 byte buffer edi points to DestinationUsing
		stosb 
		stosw
		stosl 

		# 6. Comparing Strings 
		#when comparing string esi<source string> edi<destination string>
		cld #clear direction flag 
		leal HelloWorldString, %esi
		leal H3110, %edi
		cmpsb #subtracts destination string from the source set eflags
		
		dec %esi # one byte back to beginning of string 
		dec %edi # one byte back to beginnig of string
		cmpsw # eflags [ PF ZF ]are set zero parity flag subraction set zf

		subl $2, %esi #because 2 bytes were compared 2 bytes subtracted to begining of  string no zero flag zf set
		subl $2, %edi 
		cmpsl


		# The exit() routine 

		movl $1, %eax
		movl $10, %ebx
		int $0x80

