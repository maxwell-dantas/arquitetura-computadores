# Faça um programa que leia um número inteiro, representando a duração em segundos
# de um experimento científico e imprima o tempo decorrido nesse experimento no formato h:m:s.
# Exemplo: 3755 gera uma saída 1:2:35

.text
main:
	# --- ARMAZENAMENTO INICIAL ----
	
	addi $8, $0, 3600
	addi $9, $0, 60
	
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	# --- PROCESSAMENTO ---
	
	# horas
	div $10, $8
	mflo $11
	mfhi $25
	
	# minutos
	div $25, $9
	mflo $12
	mfhi $25
	
	# segundos
	add $13, $0, $25
	
	# --- SAÍDA DE DADOS ---
	
	# horas
	add $4, $0, $11
	addi $2,$0, 1
	syscall
	
	addi $4, $0, ':'
	addi $2, $0, 11
	syscall
	
	# minutos	
	add $4, $0, $12
	addi $2,$0, 1
	syscall
	
	addi $4, $0, ':'
	addi $2, $0, 11
	syscall

	# segundos
	add $4, $0, $13
	addi $2,$0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall