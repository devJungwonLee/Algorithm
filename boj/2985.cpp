#include <iostream>
using namespace std;

int main(void) {
    int a, b, c;
    cin >> a >> b >> c;
    if (a==b+c) printf("%d=%d+%d\n", a, b, c);
    else if (a==b-c) printf("%d=%d-%d\n", a, b, c);
    else if (a==b*c) printf("%d=%d*%d\n", a, b, c);
    else if (a*c==b) printf("%d=%d/%d\n", a, b, c);
    else if (a+b==c) printf("%d+%d=%d\n", a, b, c);
    else if (a-b==c) printf("%d-%d=%d\n", a, b, c);
    else if (a*b==c) printf("%d*%d=%d\n", a, b, c);
    else if (a==b*c) printf("%d/%d=%d\n", a, b, c);
    return 0;
}