# Faça um programa que leia um número inteiro e imprima 1 se o valor for ímpar e 0 se o valor for par.

.text
main:
	# --- ARMAZENAMENTO INICIAL --
	
	addi $8, $0, 2 # valor que será usado para a divisão
	
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	# --- PROCESSAMENTO ---
	
	div $9, $8
	mfhi $4
	
	# --- SAÍDA DE DADOS ---
	
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall
