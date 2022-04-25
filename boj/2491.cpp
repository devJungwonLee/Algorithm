#include <iostream>
#include <algorithm>
using namespace std;

int main(void) {
    int N, prev, curr, dec, inc, answer = 0;
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%d", &curr);
        if (i==0) {
            dec = 1;
            inc = 1;
        } else {
            if (curr<prev) inc = 1;
            else inc++;
            if (curr>prev) dec = 1;
            else dec++;
        }
        answer = max(answer, max(inc, dec));
        prev = curr;
    }
    printf("%d\n", answer);
}