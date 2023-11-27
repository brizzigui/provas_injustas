import math;

def f(x):
    return (((1/2) * (math.e)**x) - (2 * math.sin(x)));

def f_linha(x):
    return (((1/2) * (math.e)**x) - (2 * math.cos(x)));

def modulo(x):
    return 0-x if x < 0 else x;

x0 = float(input());
ε = float (input());

while True:
    x = x0 - (f(x0)/f_linha(x0));
    
    if modulo(x - x0) < ε:
        break;
    else:
        x0 = x;
    
print(x0);