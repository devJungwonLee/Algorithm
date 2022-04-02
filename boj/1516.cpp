#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

int N, t[501], v[501], pointed[501];
vector<int> adj[501];
queue<int> q;

int main(void) {
    scanf("%d", &N);
    for (int i=1; i<=N; i++) {
        scanf("%d", &t[i]);
        int j;
        while (true) {
            scanf("%d", &j);
            if (j==-1) break;
            adj[j].push_back(i);
            pointed[i]++;
        }
    }
    for (int i=1; i<=N; i++) {
        if (pointed[i]==0) {
            v[i] = t[i];
            q.push(i);
        }
    }
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        for (auto other: adj[num]) {
            pointed[other]--;
            v[other] = max(v[other], v[num] + t[other]);
            if (pointed[other]==0) {
                q.push(other);
            }
        }
    }
    for (int i=1; i<=N; i++) printf("%d\n", v[i]);
    return 0;
}