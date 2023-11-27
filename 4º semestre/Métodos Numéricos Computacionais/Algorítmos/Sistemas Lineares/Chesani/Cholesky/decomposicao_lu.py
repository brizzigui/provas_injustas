import ches_math as cm;


def L_ini(L):
    for i in range(0, len(L)):
        L[i][i] = 1;


def solve(A):
    n = len(A);
    L = cm.aloca_matriz(n, n);
    U = cm.aloca_matriz(n, n);
    L_ini(L);

    for k in range(0, n):
        U[k][k] = A[k][k];
        for i in range(k+1, n):
            L[i][k] = A[i][k]/A[k][k];
            U[k][i] = A[k][i];
        for i in range(k+1, n):
            for j in range(k+1, n):
                A[i][j] = A[i][j] - (L[i][k] * U[k][j]);
    return L, U;