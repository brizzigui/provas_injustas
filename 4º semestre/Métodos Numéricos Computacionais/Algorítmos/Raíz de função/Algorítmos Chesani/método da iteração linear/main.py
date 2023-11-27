def f(x):
    return (x+2)**(1/2);


def modulo(x):
    return 0-x if x < 0 else x;

x0 = float(input());
ε = float (input());


x1 = f(x0);
i = 0;
while True:
    x2 = f(x1);
    
    if (modulo(x2-x1)/modulo(x2)) < ε:
        break;
    else:
        x1 = x2;
    
print(x2);