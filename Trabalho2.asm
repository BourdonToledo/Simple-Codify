.data
	
	Endere�o:	.asciiz "C:/Users/Andr�/Desktop/tate.txt"	#endere�o do arquivo que tem os numeros
	Buffer:		.space 1024
	Buffer2:	.space 1024
	
.text

	addi $v0, $zero, 8
	la $a0, Buffer2	
	addi $a1, $zero, 1024
	syscall
	
	
	
	#addi $v0, $zero, 13
	#la $a0, Endere�o	
	#addi $a1, $zero, 0
	
	#syscall
	
	#move $a0, $v0
	#la $a1, Buffer
	#addi $a2, $zero, 1024
	#addi $v0, $zero, 14
	
	#syscall
	
	
	la $a0, Buffer2
	#move $a0, $a1
	#lw $t0, ($a0)
	#addi $t0, $t0, 5
	#sw $t0, ($a0)
	addi $v0, $zero, 4
	addi $a1, $zero, 1024
	syscall
	
	#li $v0, 16  # $a0 already has the file descriptor
	#syscall
	
	addi $v0, $zero, 10  # $a0 already has the file descriptor
	syscall
	
