#include <iostream>
using namespace std;

int x, y, p1, p2;

int main(void) {
    scanf("%d %d %d %d", &x, &y, &p1, &p2);
    int a = p1, b = p2, cnt = 0;
    while (a != b && cnt < 1000) {
        if (a < b) a += x;
        else b += y;
        cnt += 1;
    }
    if (cnt == 1000) printf("-1\n");
    else printf("%d\n", a);
    return 0;
}