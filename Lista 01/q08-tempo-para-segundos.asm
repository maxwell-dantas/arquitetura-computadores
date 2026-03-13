#Faça um programa que leia três números inteiros, representando a duração em horas,
#minutos e segundos de um experimento científico e informe essa duração em segundos.

.text
main:
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5 # horas
	syscall
	add $8, $0, $2
		
	addi $2, $0, 5 # minutos
	syscall
	add $9, $0, $2
		
	addi $2, $0, 5 # segundos
	syscall
	add $10, $0, $2
	
	# --- PROCESSAMENTO ---
	
	mul $11, $8, 3600 # horas para segundos
	mul $12, $9, 60 # minutos para segundos
	
	add $13, $11, $12
	add $4, $10, $13
	
	# --- SAÍDA DE DADOS ---
	
	addi $2, $0, 1
	syscall

	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall