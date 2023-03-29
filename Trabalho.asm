.data
	
	Endereço:	.asciiz "F:/Users/a2163195/Desktop/NovaPasta/tst.txt"	#F:\Users\a2163195\Desktop\NovaPasta\tst.txt
	Buffer:		.asciiz " "
	Inpot:		.asciiz " "
	
.text

	#addi $v0, $zero, 8
	#la $a0, Inpot
	#addi $a1, $zero, 1024
	#syscall
	
	
	
	addi $v0, $zero, 13
	la $a0, Endereço
	addi $a1, $zero, 0
	syscall
	
	move $a0, $v0
	la $a1, Buffer
	addi $a2, $zero, 1024
	addi $v0, $zero, 14
	
	syscall
	
	
	la $a0, Buffer
	#move $a0, $a1
	#lw $t0, ($a0)
	#addi $t0, $t0, 5
	#sw $t0, ($a0)
	addi $v0, $zero, 4
	addi $a1, $zero, 1024
	syscall
	
	li $v0, 16  
	la $a0, Endereço
	syscall
	
	addi $v0, $zero, 10  # $a0 already has the file descriptor
	syscall