#include <string>
#include <utility>
#include <vector>
#include <queue>
using namespace std;

vector<int> adj[250001];
int v[250001];

pair<int, int> bfs(int start, int n) {
    queue<int> q;
    int d=0, cnt, num;
    for (int i=1; i<=n; i++) v[i] = 0;
    v[start] = 1;
    q.push(start);
    while (!q.empty()) {
        num = q.front();
        q.pop();
        if (v[num] > d) {
            cnt = 1;
            d = v[num];
        } else if (v[num] == d) cnt++;
        for (auto other: adj[num]) {
            if (v[other]>0) continue;
            v[other] = v[num] + 1;
            q.push(other);
        }
    }
    return make_pair(cnt, num);
}

int solution(int n, vector<vector<int>> edges) {
    for (auto edge: edges) {
        int v1 = edge[0];
        int v2 = edge[1];
        adj[v1].push_back(v2);
        adj[v2].push_back(v1);
    }
    pair<int, int> result;
    result = bfs(1, n);
    result = bfs(result.second, n);
    if (result.first > 1) return v[result.second]-1;
    result = bfs(result.second, n);
    if (result.first > 1) return v[result.second]-1;
    else return v[result.second]-2;
}