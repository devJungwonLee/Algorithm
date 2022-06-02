#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int T, N, M;
vector<int> adj[1001];
int parent[1001];

int main(void) {
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        scanf("%d %d", &N, &M);
        for (int i=1; i<=N; i++) {
            parent[i] = 0;
            adj[i].clear();
        }
        for (int i=0; i<M; i++) {
            int v1, v2;
            scanf("%d %d", &v1, &v2);
            adj[v1].push_back(v2);
            adj[v2].push_back(v1);
        }
        bool isTree = true;
        parent[1] = -1;
        queue<int> q;
        q.push(1);
        int cnt = 1;
        while (!q.empty()) {
            int num = q.front();
            q.pop();
            for (auto other: adj[num]) {
                if (other == parent[num]) continue;
                if (parent[other]!=0) {
                    isTree = false;
                    break;
                }
                parent[other] = num;
                q.push(other);
                cnt++;
            }
        }
        if (cnt!=N) isTree = false;
        if (isTree) printf("tree\n");
        else printf("graph\n");
    }
    return 0;
}
