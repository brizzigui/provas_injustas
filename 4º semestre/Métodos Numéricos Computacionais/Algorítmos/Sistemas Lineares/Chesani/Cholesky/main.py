import ches_math as cm;
from gauss import solve;
from substituicao_retroativa import op as sr;
from substituicao_sucessiva import op as ss;
import decomposicao_lu as lu;
import cholesky as cl;

A = [[5,-1,2,21],
     [-1, 8, 4, 10],
     [2, 4, 10, 50]];



LL, det, erro = cl.solve(A); #Cholesky

#cm.printa_matriz(LL);

cl.refine(LL); #remove elementos inuteis



#cm.printa_matriz(LL);

cpy = LL.copy(); #copia pra fazer a transposta sem bugar o bagulho




a, b = cm.split_matriz_solucao(LL); #separa o vetor de igualdade

y = ss(a, b, len(a)); #substituicao sucessiva na matriz inferior

LLT = list(map(list, zip(*cpy))); #transposta



LLT.remove(LLT[-1]); #remove a ultima linha

x = sr(LLT, y, len(LLT)); #substituicao sucessiva na transposta

print(x); #vetor resultado