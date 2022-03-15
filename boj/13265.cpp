#include <iostream>
#include <vector>
#include <queue>
using namespace std;

bool bfs(vector<int> *adj, int *visit, int start) {
    queue<int> q;
    visit[start] = 1;
    q.push(start);
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        for (auto v: adj[num]) {
            if (visit[num] == visit[v]) return false;
            if (visit[v] == 0) {
                visit[v] = 3 - visit[num];
                q.push(v);
            }
        }
    }
    return true;
}

int main(void) {
    int T;
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        int n, m;
        scanf("%d %d", &n, &m);
        vector<int> *adj = new vector<int>[n];
        int *visit = new int[n];
        for (int i=0; i<n; i++) visit[i] = 0;
        bool success = true;
        for (int i=0; i<m; i++) {
            int v1, v2;
            scanf("%d %d", &v1, &v2);
            adj[v1-1].push_back(v2-1);
            adj[v2-1].push_back(v1-1);
        }
        for (int i=0; i<n; i++) {
            if (visit[i]!=0) continue;
            if (!bfs(adj, visit, i)) {
                success = false;
                break;
            }
        }
        if (success) printf("possible\n");
        else printf("impossible\n");
        delete[] adj;
        delete[] visit;
    }
    return 0;
}