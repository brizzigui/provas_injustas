def modulo(x):
    return 0-x if x < 0 else x;

def LU(A):
    n = len(A); #ignorando a parte ampliada

    pivot = [i for i in range(n)];
    det = 1;
    for j in range(n-1):
        p = j;
        Amax = modulo(A[j][j]);
        for k in range(j+1, n):
            if modulo(A[k][j]) > Amax:
                Amax = modulo(A[k][j]);
                p = k;
        if p != j:
            for k in range(n):
                t = A[j][k];
                A[j][k] = A[p][k];
                A[p][k] = t;
            m = pivot[j];
            pivot[j] = pivot[p];
            pivot[p] = m;
            det = -det;
        det *= A[j][j];
        if modulo(A[j][j]) != 0:
            r = 1/A[j][j];
            for i in range(j+1, n):
                mult = A[i][j] * r;
                A[i][j] = mult;
                for k in range(j+1, n):
                    A[i][k] -= mult * A[j][k];
    det *= A[n-1][n-1];
    return A, det, pivot;