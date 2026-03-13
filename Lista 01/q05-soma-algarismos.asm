# Faça um programa que leia um número inteiro entre 0 e 999 e imprima a soma dos
# algarismos desse número. Ex.: 358 gera uma saída de 16, pois 3+5+8 = 16

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
	
	# Soma dos algarismos
	add $13, $10, $11
	add $4, $13, $12
	
	# --- SAÍDA DE DADOS ----
	
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall