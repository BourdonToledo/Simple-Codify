.data
	
	Endereço:	.space 1024 	# C:/Users/André/Desktop/new/tate.txt
	NovoF:		.space 1024 	# C:/Users/André/Desktop/new/1.txt
	Buffer:		.space 1024
	Erro:		.asciiz " erro na abertura do arquivo "
	
.text

	addi $v0, $zero, 8	# 8 = ler string do usuario para pegar endereço do arquivo
	la $a0, Endereço	# pegar buffer 
	addi $a1, $zero, 1024	# numero maximo de caracteres
	syscall
	
	la $a0, Endereço	# pefar buffer do endereço por garantia
	
	Ajuste:			# loop pra achar o bit que é colocado quando pega uma string do usuario para apagar ele.
	
		lb $t0, ($a0)	
		beq $t0, 0x0a, FimAjuste
		addi $a0, $a0, 1
		j Ajuste
	
	FimAjuste:
	
	
	sb $zero, ($a0)		# apagar o bit criado pelo prgrama para ler o endereço certo
	
	addi $v0, $zero, 13	# abrir arquivo
	la $a0, Endereço	# endereço dado pelo usuario 
	addi $a1, $zero, 0	# 0 = modo de ler
	syscall
	
	move $t1, $v0		# pegar ponteiro pro arquivo pra ler e fechalo depois
	
	bnez $v0, PosChek1	#checar se houve erro na abertura
	
	la $a0, Erro		# imprimir que a um erro
	addi $v0, $zero, 4
	addi $a1, $zero, 1024
	syscall
	
	PosChek1:
	
	move $a0, $t1		# colocar ponteiro do arquivo no lugar certo pra le-lo
	la $a1, Buffer		# buffer vai ficar com os conteudos do arquivo
	addi $a2, $zero, 1024	# tam max de conteuo lido do arquivo = 1024
	addi $v0, $zero, 14	# 14 = ler arquivo
	
	syscall
	
	move $t2, $v0		# v0 contem tamanho de conteudo lido do arquivo, colocamos em t2
	addi $t3, $zero, 1	# cria-se uma variavel pra sabermos quantas iteraçoes ja passaram
	la $a0, Buffer		# vamos pegar o buffer q contem os conteudos do arquivo pra codifica-los
	
	Ajustar:		# loop para passar por todos os char do arquivo e transforma-los no certo
		lb $t0, ($a0)	
		
		subi $t0, $t0, 121
		bltz $t0, Menor
		addi $t0, $t0, 31
		j Maior
		
		Menor:
		addi $t0, $t0, 121
		
		Maior:
		addi $t0, $t0, 5
		sb $t0, ($a0)
		addi $a0, $a0, 1
		addi $t3, $t3, 1
		
	bne $t2, $t3, Ajustar
	
	#la $a0, Buffer
	#addi $v0, $zero, 4
	#addi $a1, $zero, 1024
	#syscall
	
	
	li $v0, 16  
	move $a0, $t1
	syscall
	
	addi $v0, $zero, 8
	la $a0, NovoF
	addi $a1, $zero, 1024
	syscall
	
	la $a0, NovoF
	
	Achar:
	
		lb $t0, ($a0)
		beq $t0, 0x0a, Apagar
		addi $a0, $a0, 1
		j Achar
	
	Apagar:
	
	
	sb $zero, ($a0)
	
	
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