import ches_math as cm;

#matriz triangular inferior

def op(A, b, m):

    x = cm.vetor_resultado(m);

    for n in range(0, m):
        ant = 0;
        for a in range(0, n):
            ant += x[a] * A[n][a];
        x[n] = (b[n] - ant)/A[n][n];
    return x;
