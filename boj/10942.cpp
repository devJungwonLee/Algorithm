#include <iostream>
using namespace std;

int a[2000], d[2000][2000];

int find(int start, int end) {
    if (d[start][end]>=0) return d[start][end];
    if (a[start]!=a[end]) d[start][end] = 0;
    else if (end-start<=1) d[start][end] = 1;
    else d[start][end] = find(start+1, end-1);
    return d[start][end];
}

int main(void) {
    int n, m;
    scanf("%d", &n);
    for (int i=0; i<n; i++) scanf("%d", &a[i]);
    for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) d[i][j] = -1; 
    }
    scanf("%d", &m);
    for (int i=0; i<m; i++) {
        int s, e;
        scanf("%d %d", &s, &e);
        printf("%d\n", find(s-1, e-1));
    }
    return 0;
}