#include <iostream>
using namespace std;

int N;
long long d[10001];

int main(void) {
    scanf("%d", &N);
    d[0] = 1;
    d[2] = 1;
    for (int k=4; k<=N; k+=2) {
        for (int i=0; i<=k-2; i+=2) {
            d[k] = (d[k] + (d[i]*d[k-2-i])%987654321) % 987654321;
        }
    }
    printf("%lld\n", d[N]);
    return 0;
} 
