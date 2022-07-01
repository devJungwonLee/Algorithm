#include <iostream>
#include <cmath>
#include <algorithm>
using namespace std;

int N, M, a[9][9], answer = -1;

bool isPerfectSquare(int num) {
	return fabs(sqrt(num) - (int)sqrt(num)) < 1e-10;
}

int main(void) {
	scanf("%d %d", &N, &M);
	for (int i=0; i<N; i++) {
		for (int j=0; j<M; j++) scanf("%1d", &a[i][j]);
	}

	for (int i=0; i<N; i++) {
		for (int j=0; j<M; j++) {
			for (int d1=-N; d1<N; d1++) {
				for (int d2=-M; d2<M; d2++) {
					if (d1==0 && d2==0) continue;
					int num = 0;
					for (int k=0; ; k++) {
						int r = i+k*d1;
						int c = j+k*d2;
						if (r<0 || r>=N || c<0 || c>=M) break;
						num = num * 10 + a[r][c];
						if (isPerfectSquare(num)) answer = max(answer, num);
					}
				}
			}
		}
	}
	printf("%d\n", answer);
	return 0;
}