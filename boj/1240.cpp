#include <iostream>
#include <utility>
#include <vector>
using namespace std;

int N, M, v[1001];
vector<pair<int, int> > adj[1001];

void dfs(int cur, int dest) {
    if (cur==dest) return;
    for (auto e: adj[cur]) {
        int next = e.first;
        int d = e.second;
        if (v[next]>-1) continue;
        v[next] = v[cur] + d;
        dfs(next, dest);
    }
}

int main(void) {
    scanf("%d %d", &N, &M);

    for (int i=0; i<N-1; i++) {
        int v1, v2, d;
        scanf("%d %d %d", &v1, &v2, &d);
        adj[v1].push_back(make_pair(v2, d));
        adj[v2].push_back(make_pair(v1, d));
    }
    for (int i=0; i<M; i++) {
        int v1, v2;
        scanf("%d %d", &v1, &v2);
        for (int i=1; i<=N; i++) v[i] = -1;
        v[v1] = 0;
        dfs(v1, v2);
        printf("%d\n", v[v2]);
    }
    return 0;
}