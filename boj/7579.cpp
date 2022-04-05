#include <iostream>
#include <algorithm>
using namespace std;

int main(void) {
    int N, M, m[101], c[101], d[101][10001], maxCost = 0;
    scanf("%d %d", &N, &M);
    for (int i=1; i<=N; i++) scanf("%d", &m[i]);
    for (int i=1; i<=N; i++) {
        scanf("%d", &c[i]);
        maxCost += c[i];
    }
    for (int i=1; i<=N; i++) {
        for (int j=0; j<=maxCost; j++) {
            if (c[i]>j) d[i][j] = d[i-1][j];
            else d[i][j] = max(d[i-1][j], m[i]+d[i-1][j-c[i]]);
        }
    }
    for (int j=0; j<=maxCost; j++) {
        for (int i=1; i<=N; i++) {
            if (d[i][j]>=M) {
                printf("%d\n", j);
                return 0;
            }
        }
    }
    return 0;
}