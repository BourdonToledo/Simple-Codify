.data
	
	Endereço:	.asciiz "C:/Users/André/Desktop/new/tate.txt"
	NovoF:		.asciiz "C:/Users/André/Desktop/new/1.txt"
	Buffer:		.space 1024
	Erro:		.asciiz " erro na abertura do arquivo "
	
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
	
	bnez $v0, PosChek1
	
	la $a0, Erro
	addi $v0, $zero, 4
	addi $a1, $zero, 1024
	syscall
	
	PosChek1:
	
	
	#add $t1, $v0, $zero
	move $a0, $t1
	la $a1, Buffer
	addi $a2, $zero, 1024
	addi $v0, $zero, 14
	
	syscall
	
	move $t2, $v0
	
	move $t2, $v0
	addi $t3, $zero, 1
	la $a0, Buffer
	#move $a0, $a1
	
	Ajustar:
		lb $t0, ($a0)
	
		#ble $t0, 121, PosAjuste
		#subi $t0, $t0, 94
		
		#PosAjuste:
		addi $t0, $t0, 5
		sb $t0, ($a0)
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
	
	addi $v0, $zero, 13
	la $a0, NovoF
	addi $a1, $zero, 1
	syscall
	
	move $t1, $v0
	
	bnez $v0, PosChek2
	
	la $a0, Erro
	addi $v0, $zero, 4
	addi $a1, $zero, 1024
	syscall
	
	PosChek2:
	
	move $a0, $t1
	la $a1, Buffer
	addi $a2, $zero, 1024
	addi $v0, $zero, 15
	
	syscall
	
	li $v0, 16  
	move $a0, $t1
	syscall
	
	addi $v0, $zero, 10  # $a0 already has the file descriptor
	syscall