#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890
#           M       O                   #


# /* variáveis globais -- traduzir */
# int b[5];
# int c[4];
# int i, j, k;
# int a;
.data
b:          .word   0,0,0,0,0           # ou .word 0:5
c:          .word   0,0,0,0             # ou .word 0:4
i:          .word   0
j:          .word   0
k:          .word   0
a:          .word   0

.text
# mapa de registradores
#
# $t0 registrador para valores temporários
# $t1 registrador para valores temporários
# $t2 j * 4
# $t3 c[j]
# $t4 a
# $t5 endereço de b[i]
# $t6 endereço de b[j]
# $t7 b[i]
# $t8 b[j]

# /*...trecho de código -- traduzir */
# while ((b[i] < c[j]) && (b[j] > a))
# dentro do laço while, c[j] e a não modificam o seu valor, são constantes. 
# Podemos tirá-las do laço.
            la      $t0, c              # $t0 <- endereço base do vetor c
            la      $t1, j              # $t1 <- endereço da variável j
            lw      $t1, 0($t1)         # $t1 <- j
            sll     $t2, $t1, 2         # $t2 <- j * 4
            add     $t0, $t0, $t2       # $t0 <- endereço de c[j]
            lw      $t3, 0($t0)         # $t2 <- c[j]
# estas instruções poderiam ter sido escritas como
#           lw      $t1, j
#           sll     $t1, $t1, 2
#           lw      $t2, c($t1)
            la      $t0, a              # $t0 <- endereço da variável a 
            lw      $t4, 0($t0)         # $t4 <- a
# estas instruções poderiam ter sido escritas como
#           lw      $t3, a       
# Dentro do laço verificamos b[i] e b[j]. Os endereços destes elementos do vetor 
# não mudam. Os endereços são calculados fora do laço.
            la      $t0, b              # $t0 <- endereço base do vetor b
            la      $t1, i              # $t1 <- endereço da variável i
            lw      $t1, 0($t1)         # $t1 <- variável i
            sll     $t1, $t1, 2         # $t1 <- i * 4
            add     $t5, $t0, $t1       # $t5 <- endereço de b[i]
            add     $t6, $t0, $t2       # $t6 <- endereço de b[j]
            lw      $t7, 0(t5)          # $t7 <- b[i]
            j       while_verifica_condicao # verifica se o laço deve ser executado    
while_codigo:
#     b[i]++;      
            addi    $t7, $t7, 1         # $t7 <- b[i] + 1
            sw      $t7, 0($t5)         # b[i] = b[i] + 1
while_verifica_condicao:
# while ((b[i] < c[j]) && (b[j] > a))
# O laço será executado se as duas condições do operador AND lógico forem verdadeiras
# verificamos se (b[i] < c[j]) é verdadeira
            slt     $t0, $t7, $t3       # $t0 = 1 se b[i] <c[j]
            beq     $t0, $zero, while_fim # termina o laço while se condição é falsa
# verificamos se (b[j] > a) é verdadeira
            lw      $t8, 0(t8)          # $t8 <- b[j]
            slt     $t0, $t4, $t8       # $t0 = 1 se b[j] > a
            bne     $t0, $zero, while_codigo # Executa o laço while se a condição for verdadeira         
while_fim:
