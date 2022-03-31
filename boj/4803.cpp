#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int n, m, parent[501];
bool v[501];
vector<int> *adj;

bool bfs(int start) {
    queue<int> q;
    bool isTree = true;
    parent[start] = -1;
    v[start] = true;
    q.push(start);
    while(!q.empty()) {
        int num = q.front();
        q.pop();
        for (auto child: adj[num]) {
            if (child == parent[num]) continue;
            else if (v[child]){
                isTree = false;
                continue;
            }
            parent[child] = num;
            v[child] = true;
            q.push(child);
        }
    }
    if (!isTree) return false;
    else return true;
}

int main(void) {
    for (int t=1; ; t++) {
        scanf("%d %d", &n, &m);
        if (n==0 && m==0) break;

        int tnum = 0;
        adj = new vector<int>[n+1];
        for (int i=1; i<=n; i++) {
            v[i] = false;
            parent[i] = 0;
        }

        for (int i=0; i<m; i++) {
            int v1, v2;
            scanf("%d %d", &v1, &v2);
            adj[v1].push_back(v2);
            adj[v2].push_back(v1);
        }
        for (int i=1; i<=n; i++) {
            if (v[i]) continue;
            bool result = bfs(i);
            if (result) tnum++;
        }
        printf("Case %d: ", t);
        if (tnum==0) printf("No trees.\n");
        else if (tnum==1) printf("There is one tree.\n");
        else printf("A forest of %d trees.\n", tnum);
    }
    return 0;
}