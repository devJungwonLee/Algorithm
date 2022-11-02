#include <iostream>
using namespace std;

int cnt[100001];

int main(void) {
    int n, m;
    scanf("%d %d", &n, &m);
    for (int i=0; i<m; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        cnt[a]++;
        cnt[b]++;
    }
    for (int i=1; i<=n; i++) printf("%d\n", cnt[i]);
    return 0;
}
