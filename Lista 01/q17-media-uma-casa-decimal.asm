# Faça um programa que leia dois números inteiros e calcule e imprima a média
# aritmética simples desses dois números apresentando o resultado com um algarismo na casa fracionária.
# Ex.: 13 e 6 gera uma saída 9,5

.text
main:
	# --- ARMAZENAMENTO INICIAL --
	
	addi $8, $0, 2 
	
	# --- LEITURA DE DADOS ---
	
	# Nota 01
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	# Nota 02
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	# --- PROCESSAMENTO ---
	
	add $11, $9, $10 # nota 01 + nota 02
	div $11, $8 # (nota 01 + nota 02) / 2
	mflo $11
	mfhi $12
	mul $12, $12, 5
	
	# --- SAÍDA DE DADOS ---
	
	# Parte inteira
	add $4, $0, $11
	addi $2, $0, 1
	syscall 
	
	# Vírgula
	addi $4, $0, ','
	addi $2, $0, 11
	syscall
	
	 # Parte fracionária
	add $4, $0, $12
	addi $2, $0, 1
	syscall  
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall
