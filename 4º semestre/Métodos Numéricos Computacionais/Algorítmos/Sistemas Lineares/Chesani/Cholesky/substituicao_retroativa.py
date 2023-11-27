import ches_math as cm;

#matriz triangular superior

def op(A, b, m):

    x = cm.vetor_resultado(m);

    for n in range(0, m)[::-1]:
        ant = 0;
        for a in range(n, m):
            ant += x[a] * A[n][a];
        x[n] = (b[n] - ant)/A[n][n];
    return x;
