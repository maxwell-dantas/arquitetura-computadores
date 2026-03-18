# Faça um programa que recebe um inteiro como sendo um ano e imprime a data da
# Páscoa desse ano. Use o algoritmo de Meeus/Jones/Butcher para o cálculo. A saída
# deve ser no padrão dd/mm/aaaa
# Exemplo: 2022 gera uma saída 17/04/2022

.text
main:
	
	# --- LEITURA DE DADOS ---

	addi $2, $0, 5
	syscall
	add $8, $0, $2 # ANO
	
	# --- PROCESSAMENTO ---
	
	addi $25, $0, 19
	div $8, $25
	mfhi $9 # a, resto da divisão do ANO por 19
	
	addi $25, $0, 100
	div $8, $25
	mflo $10 # b, quociente da divisão do ANO por 100
	mfhi $11 # c, resto da divisão do ANO por 100
	
	addi $25, $0, 4
	div $10, $25
	mflo $12 # d, quociente da divisão de b por 4
	mfhi $13 # e, resto da divisão de b por 4
	
	addi $25, $0, 25
	addi $14, $10, 8
	div $14, $25
	mflo $14 # f, quociente da divisão de (b + 8) por 25
	
	addi $25, $0, 3
	sub $15, $10, $14
	addi $15, $15, 1
	div $15, $25
	mflo $15 # g, quociente da divisão de (b - f + 1) por 3
	
	addi $25, $0, 30
	mul $16, $9, 19
	add $16, $16, $10
	addi $16, $16, 15
	sub $16, $16, $12
	sub $16, $16, $15
	div $16, $25
	mfhi $16 # h, resto da divisão de (19*a + b - d - g + 15) por 30
	
	addi $25, $0, 4
	div $11, $25
	mflo $17 # i, quociente da divisão de c por 4
	mfhi $18 # k, resto da divisão de c por 4
	
	addi $25, $0, 7
	add $19, $13, $17
	mul $19, $19, 2
	addi $19, $19, 32
	sub $19, $19, $16 
	sub $19, $19, $18
	div $19, $25
	mfhi $19 # L, resto da divisão de (32 + 2*e + 2*i - h - k) por 7
	
	mul $25, $16, 11
	mul $20, $19, 22
	add $20, $20, $25
	add $20, $20, $9
	addi $25, $0, 451
	div $20, $25
	mflo $20 # m, quociente da divisão de (a + 11*h  + 22*L) por 451
	
	addi $25, $0, 31
	mul $21, $20, -7
	add $21, $21, $16
	add $21, $21, $19
	addi $21, $21, 114
	div $21, $25
	mflo $21 # mês, quociente da divisão de (h + L - 7*m + 114) por 31
	mfhi $22
	addi $22, $22, 1 # dia, ((h + L - 7*m + 114) % 31) + 1
	
	# Primeiro e segundo algarismo do dia
	addi $25, $0, 10
	div $22, $25
	mflo $9 # primeiro
	mfhi $10 # segundo
	
	# Primeiro e segundo algarismo do mês
	div $21, $25
	mflo $11 # primeiro
	mfhi $12 # segundo
	
	# Quarto algarismo do ano
	div $8, $25
	mfhi $16
	mflo $24
	
	# Terceiro algarismo do ano
	div $24, $25
	mfhi $15
	mflo $24
	
	# Primeiro e segundo algarismo do ano
	div $24, $25
	mflo $13 # primeiro
	mfhi $14 # segundo
	
	# --- SAÍDA DE DADOS ---
	
	# Primeiro algarismo do dia
	add $4, $0, $9
	addi $2, $0, 1
	syscall
	
	# Segundo algarismo do dia
	add $4, $0, $10
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	
	# Primeiro algarismo do mês
	add $4, $0, $11
	addi $2, $0, 1
	syscall
	
	# Segundo algarismo do mês
	add $4, $0, $12
	addi $2, $0, 1
	syscall
	
	addi $4, $0, '/'
	addi $2, $0, 11
	syscall
	
	# Primeiro algarismo do ano
	add $4, $0, $13
	addi $2, $0, 1
	syscall
	
	# Segundo algarismo do ano
	add $4, $0, $14
	addi $2, $0, 1
	syscall
	
	# Terceiro algarismo do ano
	add $4, $0, $15
	addi $2, $0, 1
	syscall
	
	# Quarto algarismo do ano
	add $4, $0, $16
	addi $2, $0, 1
	syscall
	
	# --- ENCERRAMENTO ---
	
	addi $2, $0, 10
	syscall