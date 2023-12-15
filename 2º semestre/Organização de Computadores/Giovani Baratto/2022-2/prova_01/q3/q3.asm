#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890
#           M       O                   #


# /* variáveis globais -- traduzir */
# int b[5];
# int c[4];
# int i, j, k;

.data
b: .word 0,0,0,0,0                      # ou .word 0:5
c: .word 0,0,0,0                        # ou .word 0:4
i: .word 0
j: .word 0
k: .word 0

.text
# mapa de registradores
#
# $t0 registrador para valores temporários
# $t1 endereço base de c
# $t2 endereço da variável i
# $t3 i


# /*...trecho de código -- traduzir */
# for (i = 0; i < 4; i++)
# {
#     c[i] = 0;
# }

# for (i = 0; i < 4; i++)
# O endereço base de c não muda no laço. Podemos trazer para fora do laço
            la      $t1, c              # $t1 <- endereço base de c          
for_inicializa:
            addi    $t3, $zero, 0       # $t3 <- 0
            la      $t2, i              # $t2 <- endereço de i
            sw      $t3, 0($t2)         # i = 0
            j	    for_verifica_condicao   
#     c[i] = 0;         
for_codigo:
            sll     $t0, $t3, 2         # $t0 <- i * 4
            add     $t0, $t1, $t0       # $t0 <- endereço de c[i]
            sw      $zero, 0($t0)       # c[i] = 0
# for (i = 0; i < 4; i++)
for_incrementa:
            addi    $t3, $t3, 1         # $t3 <- i + 1
            sw      $t3, 0($t2)         # i = i + 1
# for (i = 0; i < 4; i++)
for_verifica_condicao:
            slti    $t0, $t3, 4         # $t0 = 1 se i < 4
            bne     $t0, $zero, for_codigo # executa o laço for enquanto a consição i < 4 é verdadeira
for_fim:
            