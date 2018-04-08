
 #gcc -Wall ggdb test.S -m32 -o test
.data 
	ByteLocation:
		.byte 10

	Int32:
		.int 2
	Int16:
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
		# 1. MOV immediate value into register 

		movl $10, %eax

		# 2. MOV immediate value into memory location 

		movw $50, Int16
		
		# 3. MOV data between registers 
		movl %eax, %ebx


		# 4. MOV data from memory to register 

		movl Int32, %eax 

		# 5. MOV data from register to memory 

		movb $3, %al
		movb %al, ByteLocation

		# 6. MOV data into an indexed memory location 
		# Location is decided by BaseAddress(Offset, Index, DataSize)
		# Offset and Index must be registers, Datasize can be a numerical value 

		movl $0, %ecx
		movl $2, %edi
		movl $22, IntegerArray(%ecx,%edi , 4)

		# 7. Indirect addressing using registers 

		movl $Int32, %eax #copy the address of Int32 into %eax
		movl (%eax), %ebx # (%eax) value is copied into ebx 

		movl $9, (%eax) #copy the value 9 into to memory location pointed to by %eax
                    #%eax points to the name memory location Int32 ergo Int32 = 9
  

	

		# Exit syscall to exit the program 

		movl $1, %eax
		movl $0, %ebx
		int $0x80
