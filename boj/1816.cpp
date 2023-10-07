#include <iostream>
using namespace std;

int N;
char num[20];

bool canDivide(int x) {
    int i = 0;
    int a = 0;
    while (true) {
        while (num[i]!='\0' && a < x) {
            a = a * 10 + num[i] - '0';
            i++;
        }
        if (num[i] == '\0') return a % x == 0;
        a = a % x;
    }
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%s", num);
        bool flag = false;
        for (int j=2; j<=1000000; j++) {
            flag = canDivide(j);
            if (flag) break;
        }
        flag ? printf("NO\n") : printf("YES\n");
    }
    return 0;
}