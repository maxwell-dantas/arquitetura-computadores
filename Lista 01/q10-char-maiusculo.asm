#Faça um programa que leia um caractere minúsculo e imprima o seu equivalente maiúsculo.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	
	addi $8, $0, 32 # qualquer caractere minúsculo - 32 resultará no seu maiúsculo. (tabela ASCII)
	
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 12
	syscall
	add $9, $0, $2
	
	# --- PROCESSAMENTO ---
	
	sub $10, $9, $8
	
	# --- SAÍDA DE DADOS ---
	
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	addi $4, $0, '-'
	addi $2, $0, 11
	syscall
	
	addi $4, $0, '>'
	addi $2, $0, 11
	syscall
	
	addi $4, $0, ' '
	addi $2, $0, 11
	syscall
	
	add $4, $0, $10
	addi $2, $0, 11
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall