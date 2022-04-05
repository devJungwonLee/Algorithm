#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int N, parent[1000001], d[1000001][2];
vector<int> adj[1000001];
queue<int> q;

void recursive(int num) {
    d[num][0] = 0;
    d[num][1] = 1;
    if (adj[num].size()==1 && num!=1) return;
    for (auto other: adj[num]) {
        if (other == parent[num]) continue;
        recursive(other);
        d[num][1] += min(d[other][0], d[other][1]);
        d[num][0] += d[other][1];
    }
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N-1; i++) {
        int u, v;
        scanf("%d %d", &u, &v);
        adj[u].push_back(v);
        adj[v].push_back(u);
    }
    parent[1] = -1;
    q.push(1);
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        for (auto other: adj[num]) {
            if (other == parent[num]) continue;
            parent[other] = num;
            q.push(other);
        }
    }
    recursive(1);
    printf("%d\n", min(d[1][0], d[1][1]));
    return 0;
}