#include <iostream>
#include <map>
using namespace std;

int n;
map<int, int> xcnt, ycnt;

int main(void) {
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        int x, y;
        scanf("%d %d", &x, &y);
        xcnt[x]++;
        ycnt[y]++;
    }
    int answer = 0;
    for (auto a: xcnt) {
        if (a.second>1) answer++;
    }
    for (auto a: ycnt) {
        if (a.second>1) answer++;
    }
    printf("%d\n", answer);
    return 0;
}