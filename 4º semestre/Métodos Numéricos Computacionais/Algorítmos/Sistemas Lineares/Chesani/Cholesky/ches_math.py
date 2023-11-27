import random;

def aloca_matriz(m, n):
    A = [[0 for _ in range(0, n)] for _ in range(0, m)];
    return A;

def entrada_matriz(m, n):
    A = [[0 for _ in range(0, n)] for _ in range(0, m)]; #"malloca" tamanho da matriz A
    for i in range(0, m):
        for j in range(0, n):
            A[i][j] = float(input());
    return A;

def entrada_solucao(m):
    b = [0 for _ in range(0, m)]; #"malloca" tamanho do vetor solucao
    for bn in range(0, m): #entrada do conjunto solucao
        b[bn] = float(input("b" + str(bn) + ' '));
    return b;

def vetor_resultado(m):
    x = m * [0];
    return x;

def sub_vet(v1, v2):
    x = [0 for _ in range(0, len(v1))]
    for i in range(0, len(v1)):
        x[i] = v2[i] - v1[i];
    return x;

def printa_matriz(A):
    for i in range(len(A)):
        for j in range(len(A[0])):
            print("[{0:^10}]".format(round(A[i][j], 5)), end='');
        print('\n');
    
    
def matriz_identidade(m):
    A = aloca_matriz(m, m);
    for i in range(0, m):
        A[i][i] = 1;
    return A;    

def linha_multiplica(l, mult):
    for i in range(0, len(l)):
        l[i] = l[i] * mult;
    return l;

def gera_matriz(m, n):
    A = matriz_identidade(m);
    
    for i in range(0, 27):
        r = random.randint(0, m-1);
        A[r] = linha_multiplica(A[r], random.randint(-3, 3));
        l1 = 0;
        l2 = 0;
        while l1 == l2:
            l1 = random.randint(0, m-1);
            l2 = random.randint(0, m-1);
        A[l1] = sub_vet(A[l1], A[l2]);
    return A;

def split_matriz_solucao(A): #separa o vetor de igualdade
    b = [x[len(A[0])-1] for x in A];
    
    a = [[0 for _ in range(0, len(A[0])-1)] for _ in range(0, len(A))];
    
    for i in range(0, len(A)):
        for j in range(0, len(A[i])-1):
            a[i][j] = A[i][j];
    return a, b;

def multiplica(A, B): #multiplicacao de matrizes
    C = aloca_matriz(len(A), len(B[0]));
    for i in range(0, len(C)):
        for j in range(0, len(C[0])):
            for k in range(0, len(A[0])):
                C[i][j] += (A[i][k] * B[k][j]);
    return C;
