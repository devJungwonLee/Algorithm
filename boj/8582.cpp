#include <iostream>
#include <algorithm>
using namespace std;

int w[1000000], a[1000000], b[1000000];

int main(void) {
    int n;
    scanf("%d", &n);
    for (int i=0; i<n; i++) scanf("%d", &w[i]);
    for (int i=0; i<n; i++) {
        if (i==0) a[i] = w[i];
        else a[i] = max(a[i-1], w[i]);
    }
    for (int i=n-1; i>=0; i--) {
        if (i==n-1) b[i] = w[i];
        else b[i] = max(b[i+1], w[i]);
    }
    for (int i=0; i<n; i++) printf("%d %d\n", a[i], b[i]);
    return 0;
}