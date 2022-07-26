#include <iostream>
using namespace std;

long long a[1000000];

int main(void) {
    int T, N;
    long long answer, maxValue;
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        scanf("%d", &N);
        for (int i=0; i<N; i++) scanf("%lld", &a[i]);
        answer = 0;
        maxValue = 0;
        for (int i=N-1; i>=0; i--) {
            if (a[i] >= maxValue) maxValue = a[i];
            else answer += (maxValue - a[i]);
        }
        printf("%lld\n", answer);
    }
    return 0;
}