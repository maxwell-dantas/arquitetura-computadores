# Em Edulândia o calendário é muito parecido com o nosso, exceto pelo fato de não
# existirem anos bissextos e o mês de fevereiro ter uma quantidade fixa de dias, isso é,
# 30. Faça um programa que leia um inteiro representando um mês do ano Edulandês e
# imprima a quantidade de dias que tem esse mês.

.text
main:
	# --- ARMAZENAMENTO INICIAL --
	
	addi $8, $0, 2
	addi  $9, $0, 8
	addi $10, $0, 30 # mês base
	
	# --- LEITURA DE DADOS ---
	
	addi $2, $0, 5
	syscall
	add $11, $0, $2
	
	# --- PROCESSAMENTO ---
	
	div $11, $9 # divide o número do mês por 8
	mflo $12
	
	add $12, $11, $12 # adiciona o quociente ao número do mês
	
	div $12, $8 # verifica se o número do mês + quociente é ímpar, caso for, adiciona 1
	mfhi $12
	
	add $4, $10, $12
	
	# --- SAÍDA DE DADOS ---
	
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall