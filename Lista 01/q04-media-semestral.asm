# Faça um programa para ler duas notas de um aluno do IFRN em um curso semestral.
# Esse programa deverá apresentar a média desse aluno, após as duas provas.

.text
main:
	
	# --- ARMAZENAMENTO INICIAL ---
	
	addi $8, $0, 10 # armazena a base numérica
	addi $9, $0, 2 # armazena o total de notas

	# --- LEITURA DOS DADOS ---
	
	addi $2, $0, 5
	syscall
	add $10, $0, $2
	
	addi $2, $0, 5
	syscall
	add $11, $0, $2
	
	# --- PROCESSAMENTO ---
	
	add $12, $10, $11 # Armazena a soma das notas
	
	div $12, $9 # Divide a soma das notas por 2 ($12 = nota 1 + nota 2, $9 = 2)
	
	mflo $13
	mfhi $25
	
	# Primeira casa decimal
	
	mul $25, $25, $8
	div $25, $9
	
	mflo $14
	mfhi $25
	
	# Segunda casa decimal
	
	mul $25, $25, $8
	div $25, $9
	
	mflo $15
	
	# --- SAÍDA DE DADOS ---
	
	add $4, $0, $13
	addi $2, $0, 1
	syscall
	
	addi $4, $0, ','
	addi $2, $0, 11
	syscall
	
	add $4, $0, $14
	addi $2, $0, 1
	syscall
	
	add $4, $0, $15
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall