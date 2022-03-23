#include <iostream>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

int N, M, K, X, d[300001];
vector<int> adj[300001];
queue<int> q;

vector<int> bfs() {
    vector<int> result;
    d[X] = 1;
    q.push(X);
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        if (d[num]-1==K) {
            result.push_back(num);
            continue;
        }
        for (auto v: adj[num]) {
            if (d[v] != 0 ) continue;
            d[v] = d[num] + 1;
            q.push(v);
        }
    }
    return result;
}

int main(void) {
    scanf("%d %d %d %d", &N, &M, &K, &X);
    for (int i=0; i<M; i++) {
        int v1, v2;
        scanf("%d %d", &v1, &v2);
        adj[v1].push_back(v2);
    }
    vector<int> answer = bfs();
    sort(answer.begin(), answer.end());
    for (auto num: answer) printf("%d\n", num);
    if (answer.empty()) printf("-1\n");
    return 0;
}