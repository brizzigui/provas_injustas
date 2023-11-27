import ches_math as cm;

def ceil(x):
    y = round(x);
    return y+1 if x > y else y;

def modulo(x):
    return 0-x if x < 0 else x;

def gcd(l):
    x = modulo(min(l));
    mdc = 1;
    for i in range(1, ceil(x+1)):
        r = True;
        for j in l:
            if j % i != 0:
                r = False;
        if r == True:
            mdc = i;
    return mdc;





def solve(a, b):
    return b/a;




def solve(A):
    mult = float();
    for i in range(0, len(A)):
        for j in range(i+1, len(A)):
            if A[i][i] != 0: 
                mult = solve(A[i][i], A[j][i]);
            A[j] = cm.sub_vet(cm.linha_multiplica(A[i], mult), A[j]);        
            mdc = gcd(A[j]);
            A[j] = cm.linha_multiplica(A[j], (1/mdc));
    return A;
            
