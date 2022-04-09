#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int N, M, parent[50001], level[50001];
vector<int> adj[50001];

void makeTree() {
    queue<int> q;
    level[1] = 1;
    parent[1] = -1;
    q.push(1);
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        for (auto other: adj[num]) {
            if (other == parent[num]) continue;
            parent[other] = num;
            level[other] = level[num] + 1;
            q.push(other);
        }
    }
}

int findAncester(int v1, int v2) {
    while (level[v1]>level[v2]) v1 = parent[v1];
    while (level[v1]<level[v2]) v2 = parent[v2];
    while (v1 != v2) {
        v1 = parent[v1];
        v2 = parent[v2];
    }
    return v1;
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N-1; i++) {
        int v1, v2;
        scanf("%d %d", &v1, &v2);
        adj[v1].push_back(v2);
        adj[v2].push_back(v1);
    }
    makeTree();
    scanf("%d", &M);
    for (int i=0; i<M; i++) {
        int v1, v2;
        scanf("%d %d", &v1, &v2);
        printf("%d\n", findAncester(v1, v2));
    }
    return 0;
}