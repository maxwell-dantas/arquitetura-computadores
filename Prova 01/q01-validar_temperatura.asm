# QUESTÃO 01
# Num experimento científico a temperatura precisa estar em uma faixa de valores para ser considerado válido. 
# Faça um programa em Assembly do MIPS que receba três números, min, max e temp. 
# O primeiro e o segundo representam os limites mínimo e máximo de um intervalo de temperaturas. temp representa a temperatura atual. O programa vai imprimir 1 se o valor de temp estiver fora do intervalo entre min e max. Caso contrário ele vai imprimir o valor 0. Considere que o usuário vai sempre digitar min sendo menor que max.
# Exemplos:
# • min = 3, max = 7 e temp = 6. O programa vai imprimir 0
# • min = 3, max = 7 e temp = 1. O programa vai imprimir 1
# • min = 3, max = 7 e temp = 9. O programa vai imprimir 1
# • min = 3, max = 7 e temp = 7. O programa vai imprimir 0

.text
main:
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5 # min
	syscall
	add $8, $0, $2
	
	addi $2, $0, 5 # max
	syscall
	add $9, $0, $2 
	
	addi $2, $0, 5 # temp
	syscall
	add $10, $0, $2
	
	# --- PROCESSAMENTO ---
	
	sub $11, $10, $8  # temp - min
	sub $12, $9, $10  # max - temp
	
	srl $11, $11, 31 # signal (temp - min)
	srl $12, $12, 31 # signal (max - temp)
	
	or $4, $11, $12 # se algum dos dois sinais for negativo retorna 1 (está fora)
	
	# --- SAÍDA DE DADOS ---
	
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall