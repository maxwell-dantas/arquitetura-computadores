#Faça um programa que calcule uma média ponderada de três números inteiros, com
# pesos 3, 9 e 15, sem usar a operação de multiplicação.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	addi $8, $0, 27 # somatório dos pesos
	
	# --- LEITURA DE DADOS ---
	
	# Primeiro valor
	addi $2, $0, 5
	syscall
	add $9, $0, $2
		
	# Segundo valor
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	# Terceiro valor
	addi $2, $0, 5
	syscall
	add $11, $0, $2
	
	# --- PROCESSAMENTO ---
	
	# Primeira nota com peso
	sll $13, $9, 1
	add $13, $13, $9
	
	# Segunda nota com peso
	sll $14, $10, 3
	add $14, $14, $10
	
	# Terceira nota com peso
	sll $15, $11, 4
	sub $15, $15, $11
	
	# Soma das notas
	add $16, $13, $14
	add $16, $16, $15
	
	# Parte inteira
	div $16, $8
	mflo $17
	mfhi $25
	
	# Primeira casa decimal
	sll $24, $25, 3
	sll $23, $25, 1
	add $22, $23, $24
	
	div $22, $8
	mflo $18
	mfhi $25
	
	# Segunda casa decimal
	sll $24, $25, 3
	sll $23, $25, 1
	add $22, $23, $24
	
	div $22, $8
	mflo $19
	
	# --- SAÍDA DE DADOS ---
	
	add $4, $0, $17
	addi $2, $0, 1
	syscall
	
	addi $4, $0, ','
	addi $2, $0, 11
	syscall	
	
	add $4, $0, $18
	addi $2, $0, 1
	syscall
	
	add $4, $0, $19
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall