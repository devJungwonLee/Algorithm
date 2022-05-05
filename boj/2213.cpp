#include <iostream>
#include <vector>
#include <set>
#include <algorithm>
using namespace std;

int n, root, cost[10001], d[10001][2];
bool v[10001];
vector<int> adj[10001];
set<int> s;

void dfs1(int num) {
    for (auto other: adj[num]) {
        if (v[other]) continue;
        v[other] = true;
        dfs1(other);
        d[num][0] += max(d[other][0], d[other][1]);
        d[num][1] += d[other][0];
    }
    d[num][1] += cost[num];
}

void dfs2(int num, bool isSelected) {
    for (auto other: adj[num]) {
        if (v[other]) continue;
        v[other] = true;
        if (isSelected) dfs2(other, false);
        else {
            if (d[other][1] > d[other][0]) {
                s.insert(other);
                dfs2(other, true);
            }
            else dfs2(other, false);
        }
    }
}

int main(void) {
    scanf("%d", &n);
    for (int i=1; i<=n; i++) scanf("%d", &cost[i]);
    for (int i=1; i<=n-1; i++) {
        int v1, v2;
        scanf("%d %d", &v1, &v2);
        adj[v1].push_back(v2);
        adj[v2].push_back(v1);
    }
    for (int i=1; i<=n; i++) {
        if (adj[i].size()==1) {
            root = i;
            break;
        }
    }
    v[root] = true;
    dfs1(root);
    for (int i=1; i<=n; i++) v[i] = false;
    if (d[root][1] > d[root][0]) {
        s.insert(root);
        v[root] = true;
        dfs2(root, true);
    } else {
        v[root] = true;
        dfs2(root, false);
    }
    printf("%d\n", max(d[root][0], d[root][1]));
    for (auto num: s) printf("%d ", num);
    printf("\n");
    return 0;
}