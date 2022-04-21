#include <iostream>
using namespace std;

int main(void) {
    int n, m, pivot;
    scanf("%d %d", &n, &m);
    pivot = n-m;
    for (int i=n-m+1; i<=n-1; i++) printf("%d %d\n", pivot, i);
    for (int i=0; i<pivot; i++) printf("%d %d\n", i, i+1);
    return 0;
}