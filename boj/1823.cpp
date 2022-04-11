#include <iostream>
using namespace std;

int N, a[2000], d[2000][2000];

int findMax(int start, int end, int i) {
    if (d[start][end]>0) return d[start][end];
    if (start==end) d[start][end] = a[start]*i;
    else d[start][end] = max(a[start]*i + findMax(start+1, end, i+1), a[end]*i + findMax(start, end-1, i+1));
    return d[start][end];
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) scanf("%d", &a[i]);
    printf("%d\n", findMax(0, N-1, 1));
    return 0;
}