/* variáveis globais -- traduzir */
int x;
int y;

/*...trecho de código -- traduzir */
int P1(int x, int y)
{
	int a[3]; /* variável local */
	int i;	  /* variável local */

	for (i = 0; i < 3; i++)
	{
		a[i] = x + y + i;
	}
	a[2] = a[1] - a[0];
	return a[2];
}

int P2(int x, int y)
{
	x = P3(x, y);
	y++;
	return x + y;
}

int P1(int x, int y)
{
	x = P2(x, y);
	y++;
	return x + y;
}

int main(void)
{
	x = 7;
	y = 5;

	x = P1(x, y);
	return 0;
}
