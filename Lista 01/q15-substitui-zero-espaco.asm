# Faça um programa que leia um número inteiro entre 0 e 9999 e imprima esse
# número com 4 caracteres, substituindo o algarismo 0 por espaço.
# Exemplo.: 304 gera uma saída 3 4

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	
	addi $8, $0, 10 # base numérica
	
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5
	syscall
	add $9, $0, $2
	
	# --- PROCESSAMENTO ---
	
	# Separa o quarto algarismo
	div $9, $8
	mflo $25
	mfhi $10
	
	# Separa o terceiro algarismo
	div $25, $8
	mflo $25
	mfhi $11
	
	# Separa o segundo e o primeiro algarismo
	div $25, $8
	mflo $13 # primeiro algarismo
	mfhi $12 # segundo algarismo
	
	
	# Verifica o sinal do quarto algarismo
	sub $14, $0, $10
	srl $14, $14, 31
	mul $14, $14, 16 # verifica se o sinal vai ser 0 ou 1
	addi $10, $10, 32 # número base + 32
	add $10, $10, $14 # (número base + 32) + 16 ou 0
	
	# Verifica o sinal do terceiro algarismo
	sub $14, $0, $11
	srl $14, $14, 31
	mul $14, $14, 16
	addi $11, $11, 32
	add $11, $11, $14
	
	# Verifica o sinal do segundo algarismo
	sub $14, $0, $12
	srl $14, $14, 31
	mul $14, $14, 16
	addi $12, $12, 32
	add $12, $12, $14
	
	# Verifica o sinal do primeiro algarismo
	sub $14, $0, $13
	srl $14, $14, 31
	mul $14, $14, 16
	addi $13, $13, 32
	add $13, $13, $14
	
	# --- SAÍDA DE DADOS ---
	
	# Primeiro algarismo
	add $4, $0, $13
	addi $2, $0, 11
	syscall
	
	# Segundo algarismo
	add $4, $0, $12
	addi $2, $0, 11
	syscall
	
	# Terceiro algarismo
	add $4, $0, $11
	addi $2, $0, 11
	syscall
	
	# Quarto algarismo
	add $4, $0, $10
	addi $2, $0, 11
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall