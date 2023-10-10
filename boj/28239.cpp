#include <iostream>
using namespace std;

int n;
long long m;

pair<int, int> find() {
    long long a = 1, b;
    int x = 0, y;
    while (a + b != m) {
        b = 1;
        y = 0;
        while (a + b < m) {
            y++;
            b *= 2;
        }
        if (a + b == m) break;
        x++;
        a *= 2;
    }
    return make_pair(x, y);
}

int main(void) {
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        scanf("%lld", &m);
        pair<int, int> p = find();
        printf("%d %d\n", p.first, p.second);
    }
    return 0;
}