def f(x):
    return (x**3) - (9*x) +5;

def bolzano(a, b, f):
    return True if f(a) * f(b) < 0 else False;

def modulo(x):
    return 0-x if x < 0 else x;

a = float(input());
b = float(input());
ε = float (input());

if not bolzano(a, b, f):
    print('tem mais de uma ou nenhuma raiz');
    exit();

x = float();

while True:
    aux = x;
    x = (a + b)/2;
    if bolzano(a, x, f):
        b = x;
    else:
        a = x;
    if (b - a <= ε) or (modulo(f(x)) < ε) or (modulo(x-aux) < ε):
        break;
    
print(x);