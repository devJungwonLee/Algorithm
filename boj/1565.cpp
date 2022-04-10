#include <iostream>
using namespace std;

int dsize, msize, d[50], m[50];

int gcd(int a, int b) {
    int x = a > b ? a : b;
    int y = a < b ? a : b;
    int r;
    do {
        r = x % y;
        x = y;
        y = r;
    } while (r>0);
    return x;
}

int lcm(int a, int b) {
    int g = gcd(a, b);
    return g * (a/g) * (b/g);
}

int main(void) {
    scanf("%d %d", &dsize, &msize);
    for (int i=0; i<dsize; i++) scanf("%d", &d[i]);
    for (int i=0; i<msize; i++) scanf("%d", &m[i]);
    int dlcm = d[0], mgcd = m[0];
    for (int i=0; i<msize; i++) mgcd = gcd(mgcd, m[i]);
    for (int i=0; i<dsize; i++) {
        dlcm = lcm(dlcm, d[i]);
        if (dlcm>mgcd) {
            printf("0\n");
            return 0;
        }
    }
    int i, cnt = 0;
    for (i=1; i*i<mgcd; i++) {
        if (mgcd%i==0) {
            if (i%dlcm==0) cnt++;
            if ((mgcd/i)%dlcm==0) cnt++;
        }
    }
    if (i*i==mgcd && i%dlcm==0) cnt++;
    printf("%d\n", cnt);
    return 0;
}