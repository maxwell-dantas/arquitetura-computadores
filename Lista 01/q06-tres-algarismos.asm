#Faça um programa que leia um número inteiro entre 0 e 999 e imprima esse número
# com 3 algarismos. Ex.: 23 gera uma saída 023. 8 gera uma saída 008.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	
	addi $8, $0, 10 # Valor da base numérica
	
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	# --- PROCESSAMENTO ---
	
	# Separa o terceiro algarismo
	div $9, $8
	mflo $25
	mfhi $10
	
	# Separa o segundo algarismo
	div $25, $8
	mflo $25
	mfhi $11
	
	# Separa o primeiro algarismo
	div $25, $8
	mfhi $12
	
	# --- SAÍDA DE DADOS ---
	
	add $4, $0, $12 # primeiro algarismo
	addi $2, $0, 1
	syscall
	
	add $4, $0, $11 # segundo algarismo
	addi $2, $0, 1
	syscall
	
	add $4, $0, $10 # terceiro algarismo
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall