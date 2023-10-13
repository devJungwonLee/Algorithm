#include <iostream>
using namespace std;

int N, X, K;

int main(void) {
    scanf("%d %d %d", &N, &X, &K);
    for (int i=0; i<K; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        if (X == a || X == b) {
            X = a + b - X;
        }
    }
    printf("%d\n", X);
    return 0;
}