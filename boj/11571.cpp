#include <iostream>
#include <cstring>
using namespace std;

int main(void) {
    int T, indices[1100];
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        memset(indices, -1, sizeof(indices));
        int a, b, integer, end, tmp, q;
        scanf("%d %d", &a, &b);
        integer = a/b;
        a = a%b;
        tmp = a;
        for (int idx=0; ; idx++) {
            if (indices[tmp]!=-1 || tmp == 0) {
                end = idx;
                break;
            }
            indices[tmp] = idx;
            tmp = tmp * 10 % b;
        }
        printf("%d.", integer);
        for (int i=0; i<end; i++) {
            a *= 10;
            if (tmp !=0 && i==indices[tmp]) printf("(");
            printf("%d", a/b); 
            a = a%b;
        }
        if (tmp==0) printf("(0");
        printf(")\n");
    }
    return 0;
}