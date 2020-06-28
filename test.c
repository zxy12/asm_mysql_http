#include <stdio.h>

int NN[10][10];

int tt(int x, int y) {
	int z = x + y;
	return z;
}

int main() {
	int a = 1, b= 2;
	tt(a, b);
	return 0;
}
