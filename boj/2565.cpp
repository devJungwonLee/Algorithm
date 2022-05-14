#include <iostream>
#include <utility>
#include <vector>
#include <algorithm>
using namespace std;

int d[100];

int main(void) {
    int n, answer = 0;
    vector<pair<int, int> > v;
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        int a, b;
        scanf("%d %d", &a, &b);
        v.push_back(make_pair(a, b));
    }
    sort(v.begin(), v.end());
    
    for (int i=0; i<n; i++) {
        d[i] = 1;
        for (int j=0; j<i; j++) {
            if (v[i].second > v[j].second) {
                d[i] = max(d[i], d[j]+1);
            }
        }
        answer = max(answer, d[i]);
    }
    
    printf("%d\n", n-answer);
    return 0;
}