# Faça um programa que leia um número entre 0 e 9999 e imprima cada algarismo em uma linha diferente.
# Ex.: 3219 imprime
# 9
# 1
# 2
# 3
# Ex.: 123
# 3
# 2
# 1
# 0

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	
	addi $8, $0, 10 # valor da base numérica
	
	# --- LEITURA DE DADOS ----
	
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
	
	# Separa o segundo algarismo
	div $25, $8
	mflo $25
	mfhi $12
	
	# Separa o primeiro algarismo
	div $25, $8
	mflo $25
	mfhi $13
	
	# --- SAÍDA DE DADOS ---
	
	add $4, $0, $10 # quarto algarismo
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
		
	add $4, $0, $11 # terceiro algarismo
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
		
	add $4, $0, $12 # segundo algarismo
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '\n'
	addi $2, $0, 11
	syscall
		
	add $4, $0, $13 # primeiro algarismo
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall