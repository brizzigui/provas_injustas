#*******************************************************************************
#        1         2         3         4         5         6         7         8
#2345678901234567890123456789012345678901234567890123456789012345678901234567890
#           M       O                   #



# int x;
# int y;

.data
x:          .word   0                   # int x
y:          .word   0                   # int y

.text

# executamos o procedimento main
init:   
            jal     main
# terminamos o programa
finit:  
            add     $a0, $zero, $v0     # $a0 <- valor de retorno
            add     $v0, $zero, 17      # serviço 17: exit 2
            syscall                     # realizamos a chamada ao serviço exit2


# int P3(int x, int y)
# mapa da pilha
#   $sp + 4  :   a[3]
#   $sp + 0  :   i                      # i pode ser mantido somente em um registrador
# mapa de registradores
#   $t0      :   i
#   $t1      :   valores temporários
#   $t2      :   endereço base de a
#   $t3      :   x + y
#   $t4      :   x + y + i
#   $t5      :   a[1]
#   $t6      :   a[0]
#   $v0      :   a[2]
P3: 
# {
# prólogo   
            addi    $sp, $sp, -16       # ajustamos a pilha
# 	int a[3]; /* variável local */
# 	int i;	  /* variável local */

# 	for (i = 0; i < 3; i++)
# o endereço base do vetor a é constante dentro do laço. Calculamos o 
# endereço uma única vez
            addi    $t2, $sp, 4         # $t2 <- endereço base de a: $sp + 4
# o valor de x + y é constante dentro do laço. Calculamos uma única vez
            add     $t3, $a0, $a1       # $t3 <- x + y
for_inicializacao:
            addi    $t0, $zero, 0       # $t0 <- 0
            sw      $t0, 0($sp)         # i = 0
# 	{
for_codigo:
# 		a[i] = x + y + i;
            add     $t4, $t3, $t0       # $t4 <- x + y + i
            sll     $t1, $t0, 2         # $t1 <- i * 4
            add     $t1, $t2, $t1       # $t1 <- endereço de a[i]
            sw      $t4, 0($t1)         # a[i] = x + y + i
# 	}
for_incremento:
            addi    $t0, $t0, 1         # $t0 <- i + 1
            sw      $t0, 0($sp)         # i = i + 1
for_verificacao:
            slti    $t1, $t0, 3         # $t1 = 1 se i < 3
            bne     $t1, $zero, for_codigo  # enquanto i<3 executa o laço for
for_fim:
# 	a[2] = a[1] - a[0];
            lw      $t5, 8($sp)         # $t5 <- a[1]
            lw      $t6, 4($sp)         # $t6 <- a[0]
            sub     $v0, $t5, $t6       # $v0 <- a[1] - a[0]
            sw      $v0, 12($sp)        # a[2] = a[1] - a[0]
# epílogo
            addi    $sp, $sp, 16        # ajustamos a pilha
# 	return a[2];
            jr      $ra                 # retornamos ao procedimento chamador
# }



# int P2(int x, int y)
# mapa da pilha
#   $sp + 4 :   $a1
#   $sp + 0 :   $ra
# mapa de registradores
#   $a0     :   x
#   $a1     :   y
P2:
# {
# prólogo   
            addi    $sp, $sp, -8        # ajustamos a pilha
            sw      $a1, 4($sp)         # salvamos y na pilha
            sw      $ra, 0($sp)         # salvamos na pilha o endereço de retorno
# 	x = P3(x, y);
            jal     P3                  # chamamos P3(x, y)
            add     $a0, $zero, $v0     # $a0 <- P3(x, y)
# 	y++;
            lw      $a1, 4($sp)         # $a1 <- y
            addi    $a1, $a1, 1         # $a1 <- y + 1
# epílogo
            lw      $ra, 0($sp)         # restauramos o endereço de retorno
            addi    $sp, $sp, 8         # ajustamos a pilha
# 	return x + y;
            add     $v0, $a0, $a1       # $v0 <- x + y
            jr      $ra                 # retornamos ao procedimento chamador
# }



# int P1(int x, int y)
# mapa da pilha
#   $sp + 4 :   $a1
#   $sp + 0 :   $ra
# mapa de registradores
#   $a0     :   x
#   $a1     :   y
P1:
# {
# prólogo   
            addi    $sp, $sp, -8        # ajustamos a pilha
            sw      $a1, 4($sp)         # salvamos y na pilha
            sw      $ra, 0($sp)         # salvamos na pilha o endereço de retorno
# corpo do programa
# 	x = P2(x, y);
            jal     P2                  # chamamos P2(x, y)
            add     $a0, $zero, $v0     # $a0 <- P2(x, y)
# 	y++;
            lw      $a1, 4($sp)         # $a1 <- y
            addi    $a1, $a1, 1         # $a1 <- y + 1
# epílogo
            lw      $ra, 0($sp)         # restauramos o endereço de retorno
            addi    $sp, $sp, 8         # ajustamos a pilha
# 	return x + y;
            add     $v0, $a0, $a1       # $v0 <- x + y
            jr      $ra                 # retornamos ao procedimento chamador
# }

# int main(void)
# mapa da pilha
#   $sp + 8 :   $ra
#   $sp + 4 :   x
#   $sp + 0 :   y
# mapa de registradores
#   $t1     :   x
#   $t2     :   y
main:
# {
# prólogo   
            addi    $sp, $sp, -12       # ajustamos a pilha
            sw      $ra, 8($sp)         # guardamos o endereço de retorno
# corpo do programa
# 	x = 7;
            addi    $t1, $zero, 7       # $t1 <- 7
            sw      $t1, 4($sp)         # x = 7
# 	y = 5;
            addi    $t2, $zero, 5       # $t2 <- 5
            sw      $t2, 0($sp)         # y = 5
# 	x = P1(x, y);
            add     $a0, $zero, $t1     # $a0 <- x
            add     $a1, $zero, $t2     # $a1 <- y
            jal     P1                  # chamamos o procedimento P1(x, y)
            add     $t1, $zero, $v0     # $t1 <- P1(x, y)
            sw      $t1, 4($sp)         # x = P1(x, y)
# epílogo
            lw      $ra, 8($sp)         # restauramos o endereço de retorno
            addi    $sp, $sp, 12        # restauramos a pilha
# 	return 0;
            addi    $v0, $zero, 0       # valor de retorno 0
            jr      $ra                 # retornamos ao procedimento chamador
# }
