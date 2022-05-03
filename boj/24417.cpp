#include <iostream>
using namespace std;

int main(void) {
    int n, x=1, y=1, z;
    scanf("%d", &n);
    for (int i=3; i<=n; i++) {
        z = (x + y) % 1000000007;
        x = y;
        y = z;
    }
    printf("%d %d\n", z, n-2);
    return 0;
}