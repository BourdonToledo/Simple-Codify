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
	
	move $t1, $v0
	#add $t1, $v0, $zero
	move $a0, $v0
	la $a1, Buffer
	addi $a2, $zero, 1024
	addi $v0, $zero, 14
	
	syscall
	
	move $t2, $v0
	addi $t3, $zero, 1
	la $a0, Buffer
	#move $a0, $a1
	
	Ajustar:
		lw $t0, ($a0)
	
		#ble $t0, 121, PosAjuste
		#subi $t0, $t0, 94
		
		#PosAjuste:
		addi $t0, $t0, 5
		sw $t0, ($a0)
		addi $a0, $a0, 1
		addi $t3, $t3, 1
		
	bne $t2, $t3, Ajustar	
	
	la $a0, Buffer
	addi $v0, $zero, 4
	addi $a1, $zero, 1024
	syscall
	
	li $v0, 16  
	move $a0, $t1
	syscall
	
	addi $v0, $zero, 10  # $a0 already has the file descriptor
	syscall
	
	