#include <iostream>
#include <vector>
#include <utility>
using namespace std;

int N, numOfSubTree[200001];
long long sum[200001];
bool v[200001];
vector<pair<int, int> > adj[200001];

void dfs(int x, long long s) {
    int num = 1;
    v[x] = true;
    sum[1] += s;
    for (auto p: adj[x]) {
        int y = p.first;
        int c = p.second;
        if (v[y]) continue;
        dfs(y, s+c);
        num += numOfSubTree[y];
    }
    numOfSubTree[x] = num;
}

void dfs2(int x) {
    for (auto p: adj[x]) {
        int y = p.first;
        int c = p.second;
        if (v[y]) continue;
        v[y] = true;
        int a = numOfSubTree[y];
        sum[y] = sum[x] + ((long long)N-2*(long long)a)*c;
        dfs2(y);
    }
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N-1; i++) {
        int v1, v2, c;
        scanf("%d %d %d", &v1, &v2, &c);
        adj[v1].push_back(make_pair(v2, c));
        adj[v2].push_back(make_pair(v1, c));
    }
    dfs(1, 0);
    for (int i=1; i<=N; i++) v[i] = false;
    v[1] = true;
    dfs2(1);
    for (int i=1; i<=N; i++) printf("%lld\n", sum[i]);
    return 0;
}
