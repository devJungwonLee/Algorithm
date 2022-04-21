#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

vector<int> v;

int main(void) {
    int l, num, n;
    scanf("%d", &l);
    for (int i=0; i<l; i++) {
        scanf("%d", &num);
        v.push_back(num);
    }
    scanf("%d", &n);
    v.push_back(n);
    sort(v.begin(), v.end());
    int idx, left, right;
    for (int i=0; i<v.size(); i++) {
        if (v[i] == n) idx=i;
    }
    if (idx==0) left = n;
    else if (v[idx]==v[idx-1]) {
        printf("0\n");
        return 0;
    }
    else left = n - v[idx-1];
    right = v[idx+1] - n;
    printf("%d\n", left * right -1);
    return 0;
}