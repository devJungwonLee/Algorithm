#include <iostream>
using namespace std;

int l = 0, r = 0;

int main(void) {
    int A, B;
    scanf("%d %d", &A, &B);
    while (A!=1 || B!=1) {
        if (A>B) {
            if (B==1) {
                l+=A-1;
                A=1;
            } else {
                l += A/B;
                A = A%B;
            }
        } else {
            if (A==1) {
                r+=B-1;
                B=1;
            } else {
                r += B/A;
                B= B%A;
            }
        }
    }
    printf("%d %d\n", l, r);
    return 0;
}