#include <iostream>
#include <cmath>
using namespace std;

int N, x = 0, y = 0;

int main(void) {
    scanf("%d", &N);
    getchar();
    for (int i=0; i<N; i++) {
        char c;
        scanf("%c", &c);
        getchar();
        if (abs(x-y) >= 2) continue;
        if (c == 'D') x++;
        else y++;
    }
    printf("%d:%d\n", x, y);
    return 0;
}