import ches_math as cm;


def solve(A):
    n = len(A);
    erro = 0;
    det = 1;
    for j in range(n):
        soma = 0;
        for k in range(j):
            soma += A[j][k] ** 2;
        t = A[j][j] - soma;
        if t > 0:
            A[j][j] = t**(1/2);
            r = 1/A[j][j];
            det *= t;
        else:
            erro = 1;
        for i in range(j+1, n):
            soma = 0;
            for k in range(j):
                soma += A[i][k] * A[j][k];
            A[i][j] = (A[i][j] - soma) * r;
    return A, det, erro;


def refine(A): #remove os elementos inúteis da matriz
    for i in range(len(A)):
        for j in range(i+1, len(A[i])-1):
            A[i][j] = 0;