#include <iostream>
#include <set>
using namespace std;

int n, m, d[41][2], vip;
set<int> s;

int main(void) {
    scanf("%d", &n);
    scanf("%d", &m);
    for (int i=0; i<m; i++) {
        scanf("%d", &vip);
        s.insert(vip);
    }
    for (int i=1; i<=n; i++) {
        if (i==1) {
            d[i][0] = 1;
            d[i][1] = 0;
        } else {
            d[i][0] = d[i-1][0] + d[i-1][1];
            if (s.find(i)!=s.end() || s.find(i-1)!=s.end()) d[i][1] = 0;
            else d[i][1] = d[i-1][0];
        }
    }
    printf("%d\n", d[n][0]+d[n][1]);
    return 0;
}