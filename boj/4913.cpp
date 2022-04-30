#include <iostream>
using namespace std;

int l, L, U, cnt1[1000001], cnt2[1000001];
bool p[1000001];

int main(void) {


    p[0] = false;
    p[1] = false;
    for (int i=2; i<=1000000; i++) p[i] = true;
    for (int i=2; i<=1000000; i++) {
        if (p[i] == false) continue;
        for (int j=2*i; j<=1000000; j+=i) p[j] = false;
    }
    cnt1[0] = 0;
    cnt2[0] = 0;
    for (int i=1; i<=1000000; i++) {
        cnt1[i] = cnt1[i-1] + (p[i] ? 1 : 0);
        cnt2[i] = cnt2[i-1] + ((p[i] && (i==2 || i%4==1))? 1 : 0);
    }

    while (true) {
        scanf("%d %d", &L, &U);
        if (L==-1 && U==-1) break;
        if (U<0) {
            printf("%d %d 0 0\n", L, U);
            continue;
        }
        l = L;
        if (L<0) L = 0;
        int x, y;
        if (L==0) {
            x = cnt1[U];
            y = cnt2[U];
        } else {
            x = cnt1[U] - cnt1[L-1];
            y = cnt2[U] - cnt2[L-1];
        }
        printf("%d %d %d %d\n", l, U, x, y);
    }
    return 0;
}