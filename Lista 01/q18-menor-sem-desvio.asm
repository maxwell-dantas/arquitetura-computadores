# Faça um programa que leia dois números e informe o menor deles (use apenas operações aritméticas e lógicas).

.text
main:
	# --- LEITURA DE DADOS ---
	
	# Número 01
	addi $2, $0, 5
	syscall
	add $8, $0, $2
	
	# Número 02
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	# --- PROCESSAMENTO ---
	
	sub $10, $8, $9
	not $11, $10 # not $10
	
	srl $10, $10, 31
	srl $11, $11, 31
	
	mul $12, $8, $10 # a * sinal
	mul $13, $9, $11 # b * sinal'
	
	add $4, $12, $13
	
	
	# --- SAÍDA DE DADOS ---
	
	 addi $2, $0, 1
	 syscall

	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall
