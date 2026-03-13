# Faça um programa que leia 1 inteiro entre 100 e 999 e o imprima escrito de trás para
# frente. Exemplo: 384 gera uma saída 483

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	
	addi $8, $0, 10 # valor da base numérica
	
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
	
	add $4, $0, $10
	addi $2, $0, 1
	syscall
		
	add $4, $0, $11
	addi $2, $0, 1
	syscall	
	
	add $4, $0, $12
	addi $2, $0, 1
	syscall	

	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall