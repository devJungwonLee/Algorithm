#include <iostream>
using namespace std;

int main(void) {
    int num[10] = {9,7,8,0,9,2,1,4,1,8}, a, sum=0;
    for (int i=0; i<13; i++) {
        if (i<10) a = num[i];
        else scanf("%d", &a);
        if (i%2==0) sum += a;
        else sum += 3*a;
    }
    printf("The 1-3-sum is %d\n", sum);
    return 0;
}