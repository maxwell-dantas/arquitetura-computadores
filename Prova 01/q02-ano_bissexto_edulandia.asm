# Faça um programa em Assembly do MIPS que receba um número inteiro representando um ano no calendário de Edulândia e imprima 1 se esse ano for bissexto e 0 caso contrário.
# Um ano edulandês é bissexto se:
# • for divisível por 300 ou por 500; OU
# • se for divisível por 3 e não for por 100.

.text
main:
	# --- ARMAZENAMENTO INICIAL ---
	
	addi $8, $0, 300
	addi $9, $0, 500
	addi $10, $0, 3
	addi $11, $0, 100

	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5
	syscall
	add $12, $0, $2
	
	# --- PROCESSAMENTO ---
	
	div $12, $8
	mfhi $13 # resto do ano por 300
	
	div $12, $9
	mfhi $14 # resto do ano por 500
	
	div $12, $10
	mfhi $15 # resto do ano por 3
	
	div $12, $11
	mfhi $16 # resto do ano por 100
	
	sub $13, $0, $13 # signal_resto = 0 - (resto do ano por 300)
	sub $14, $0, $14 # signal_resto = 0 - (resto do ano por 500)
	sub $15, $0, $15 # signal_resto = 0 - (resto do ano por 3)
	sub $16, $0, $16 # signal_resto = 0 - (resto do ano por 100)
	
	not $13, $13 # se for divisível, é verdade, então o sinal será 1
	not $14, $14 # se não for divisível, é mentira, então o sinal será 0
	not $15, $15 # explicações acima
	
	srl $13, $13, 31 # pega o signal_resto
	srl $14, $14, 31 # pega o signal_resto
	srl $15, $15, 31 # pega o signal_resto
	srl $16, $16, 31 # pega o signal_resto
	
	or $17, $13, $14 # se for divisível por 300 ou 500, retornará 1
	and $18, $15, $16 # se for divisível por 3 e não for por 100, retornará 1
	
	or $4, $17, $18 # caso alguma das alternativas retornar 1, então é bissexto
	
	# --- SAÍDA DE DADOS ---
	
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall