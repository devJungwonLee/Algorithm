#include <iostream>
#include <algorithm>
using namespace std;

int n, t[1500000], p[1500000], d[1500001][2];

int main(void) {
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        scanf("%d %d", &t[i], &p[i]);
    }
    for (int i=0; i<n; i++) {
        int maxValue = max(d[i][0], d[i][1]);
        d[i+1][0] = maxValue;
        if (i+t[i] > n) continue;
        d[i+t[i]][1] = max(d[i+t[i]][1], maxValue + p[i]);
    }
    printf("%d\n", max(d[n][0], d[n][1]));
    return 0;
}