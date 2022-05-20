#include <iostream>
using namespace std;

int N, d[100];

char f(int n) {
    int k = 0;
    while (n>d[k]) k++;
    n -= d[k-1];
    if (n==1) return 'm';
    else if (n<=k+3) return 'o';
    else return f(n-k-3);
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<=28; i++) {
        if (i==0) d[i] = 3;
        else d[i] = 2 * d[i-1] + i + 3;
    }
    printf("%c\n", f(N));
    return 0;
}
