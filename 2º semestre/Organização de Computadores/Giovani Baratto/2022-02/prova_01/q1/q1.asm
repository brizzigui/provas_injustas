 #*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890
#           M     O                 #


# /* variáveis globais -- traduzir */
# int b[5];
# int c[4];
# int i, j, k;
# int a;
.data
b: .word 0,0,0,0,0 # ou .word 0:5
c: .word 0,0,0,0   # ou .word 0:4
i: .word 0
j: .word 0
k: .word 0
a: .word 0

.text
# mapa de registradores

#   $t0     registrador para valores temporários
#   $t1     endereço de i, i e (i * 4)
#   $t2     c[i]
#   $t3     a
#   $t4     endereço de j, j e (j * 4)
#   $t5     endereço de b[j]
#   $t6     b[j]
#   $t7     k e k + 1
#   $t8     b[2] e b[2] + 34
#   $t9     endereço base de b

# /*...trecho de código -- traduzir */
# if (c[i] > a)
            la	  $t0, c          # $t0 <- endereço base do vetor c
            la      $t1, i          # $t1 <- endereço da variável i
            lw      $t1, 0($t1)     # $t1 <- i
            sll     $t1, $t1, 2     # $t1 <- i * 4
            add     $t0, $t0, $t1   # $t0 <- endereço de c[i]
            lw      $t2, 0($t0)     # $t2 <- c[i]
            la      $t0, a          # $t0 <- endereço da variável a    
            lw      $t3, 0($t0)     # $t3 <- a
            slt     $t0, $t3, $t2   # $t0 = 1 se c[i] > a
            beq     $t0, $zero, fim_if1 # se a condição é falsa, não executa o if (if1_v)
if1_v:
# {
#     if (b[j] == c[i])
            la      $t9, b          # $t9 <- endereço base do vetor b
            la      $t4, j          # $t4 <- endereço de j
            lw      $t4, 0($t4)     # $t4 <- j
            sll     $t4, $t4, 2     # $t4 <- j * 4
            add     $t5, $t9, $t4   # $t5 <- endereço de b[j]
            lw      $t6, 0($t5)     # $t6 <- b[j]
            beq     $t6, $t2, if2_v # se a condição é verdadeira, execute o if (if2_v)
if2_f:                              # senão, executa o código else (if2_f)
      #     else
#     {
#         k++;
            la      $t0, k          # $t0 <- endereço de k
            lw      $t7, 0($t0)     # $t7 <- k
            addi    $t7, $t7, 1     # $t7 <- k + 1
            sw      $t7, 0($t0)     # k = k + 1
#         goto fim;
            j       fim             # desvie incondicialmente para fim
#     }
if2_v:    
#     {
#         b[j] = b[2] + 34;
            lw      $t8, 8($t9)     # $t8 <- b[2]
            addi    $t8, $t8, 34    # $t8 <- b[2] + 34
            sw      $t8, 0 ($t5)    # b[j] = b[2] + 34
#     }
fim_if2:
# }
fim_if1:
fim:
# fim:
