#include <iostream>
#include <algorithm>
using namespace std;

int main(void) {
    int n;
    double d[10000][2], num;
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        scanf("%lf", &num);
        if (i==0) {
            d[i][0] = num;
            d[i][1] = num;
        } else {
            d[i][0] = max(d[i-1][0], d[i-1][1]);
            d[i][1] = max(num, d[i-1][1]*num);
        }
    }
    printf("%.3lf\n", max(d[n-1][0], d[n-1][1]));
    return 0;
}