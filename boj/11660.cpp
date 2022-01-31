#include <iostream>
using namespace std;

int N, M, x1, x2, y1, y2;
long long a[1024][1024];

int main(void) {
    scanf("%d %d", &N, &M);
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            long long sum;
            scanf("%lld", &sum);
            if (i>0) sum += a[i-1][j];
            if (j>0) sum += a[i][j-1];
            if (i>0 && j>0) sum -= a[i-1][j-1];
            a[i][j] = sum;
        }
    }
    for (int i=0; i<M; i++) {
        scanf("%d %d %d %d", &x1, &y1, &x2, &y2);
        x1--;
        y1--;
        x2--;
        y2--;
        long long sum = a[x2][y2];
        if (x1>0) sum -= a[x1-1][y2];
        if (y1>0) sum -= a[x2][y1-1];
        if (x1>0 && y1>0) sum += a[x1-1][y1-1];
        printf("%lld\n", sum);
    }
    return 0;
}