#include <iostream>
#include <utility>
#include <queue>
#include <map>
#include <algorithm>
using namespace std;

int n, m = 0, answer = 0;
map<int, priority_queue<int> > pqs;

int main(void) {
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        int p, d;
        scanf("%d %d", &p, &d);
        m = max(m, d);
        pqs[d].push(p);
    }
    for (int i=m; i>=2; i--) {
        if (pqs.find(i) == pqs.end()) continue;
        int top = pqs[i].top();
        pqs[i].pop();
        for (int j=i-1; j>0 && !pqs[i].empty(); j--) {
            pqs[j].push(pqs[i].top());
            pqs[i].pop();
        }
        pqs[i].push(top);
    }
    for (int i=1; i<=m; i++) {
        if (pqs.find(i) == pqs.end()) continue;
        int top = pqs[i].top();
        answer += top;
    }
    printf("%d\n", answer);
    return 0;
}