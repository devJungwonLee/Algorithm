#include <iostream>
using namespace std;

int main(void) {
    int n;
    cin >> n;
    int x = 1, y = 2, z;
    if (n==1) printf("1\n");
    else if (n==2) printf("2\n");
    else {
        for (int i=3; i<=n; i++) {
            z = (x + y)%10;
            x = y;
            y = z;
        }
        printf("%d\n", z);
    }
    return 0;
}