#include <string>
#include <vector>
#include <map>
#include <set>
using namespace std;

vector<int> adj[200000];
int parent[200000], prv[200000], nxt[200000];
bool from[200000], to[200000], visit[200000];

void findParent(int room) {
    for (auto child: adj[room]) {
        if (child == parent[room]) continue;
        parent[child] = room;
        findParent(child);
    }
}

bool check(int start) {
    if (visit[start]) return false;
    visit[start] = true;
    for (int num=start; num!=0; num=parent[num]) {
        if (to[num]) {
            if (num == nxt[start]) return false;
            bool result = check(prv[num]);
            if (!result) return false;
        }
    }
    for (int num=nxt[start]; num!=0; num=parent[num]) {
        if (to[num] && num!=nxt[start]) {
            bool result = check(prv[num]);
            if (!result) return false;
        }
    }
    to[nxt[start]] = false;
    return true;
}

bool solution(int n, vector<vector<int>> path, vector<vector<int>> order) {
    for (int i=0; i<n; i++) {
        prv[i] = -1;
        nxt[i] = -1;
    }
    for (auto p: path) {
        adj[p[0]].push_back(p[1]);
        adj[p[1]].push_back(p[0]);
    }
    for (auto ord: order) {
        if (ord[1]==0) return false;
        prv[ord[1]] = ord[0];
        nxt[ord[0]] = ord[1];
        from[ord[0]] = true;
        to[ord[1]] = true;
    }
    parent[0] = -1;
    findParent(0);
    bool result = true;
    for (auto ord: order) {
        if (visit[ord[0]]) continue;
        result = result & check(ord[0]);
        if (!result) return false;
    }
    return true;
}