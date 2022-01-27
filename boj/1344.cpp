#include <iostream>
#include <cmath>
using namespace std;

int comb[19][19], r[12]={0, 1, 4, 6, 8, 9, 10, 12, 14, 15, 16, 18};
double pa, pb;

double f(int r, double p) {
	return (double)comb[18][r] * pow(p, r) * pow(1-p, 18-r);
}

int main(void) {
	for (int i=1; i<=18; i++) {
		for (int j=0; j<=i; j++) {
			if (j==0 || j==i) comb[i][j]=1;
			else comb[i][j] = comb[i-1][j-1] + comb[i-1][j];
		}
	}

	int a, b;
	scanf("%d %d", &a, &b);
	pa = (double)a / 100;
	pb = (double)b / 100;

	double sum = 0;
	for (int i=0; i<12; i++) {
		for (int j=0; j<12; j++) {
			sum += f(r[i], pa) * f(r[j], pb);
		}
	}
	printf("%.16lf\n", 1-sum);
	return 0;
}
