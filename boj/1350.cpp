#include <iostream>
using namespace std;

int main(void) {
    int N, files[50], cluster;
    long long answer = 0;
    scanf("%d", &N);
    for (int i=0; i<N; i++) scanf("%d", &files[i]);
    scanf("%d", &cluster);
    for (int i=0; i<N; i++) {
        answer += files[i]/cluster + (files[i] % cluster != 0);
    }
    answer *= cluster;
    printf("%lld\n", answer);
    return 0;
}