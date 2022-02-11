#include <string>
#include <vector>
#include <algorithm>
#include <queue>
using namespace std;
vector<int> adj[1000];
queue<int> q;

int f(int start, int except) {
    int cnt = 0;
    bool visited[1000];
    for (int i=0; i<1000; i++) visited[i] = false;
    visited[start] = true;
    q.push(start);
    while (!q.empty()) {
        int v = q.front();
        q.pop();
        cnt++;
        for (int i=0; i<adj[v].size(); i++) {
            int w = adj[v][i];
            if (w == except) continue;
            if (visited[w]) continue;
            visited[w] = true;
            q.push(w);
        }
    }
    return cnt;
}

int solution(int n, vector<vector<int>> wires) {
    int answer = 10000;
    for (int i=0; i<wires.size(); i++) {
        int v1 = wires[i][0] - 1;
        int v2 = wires[i][1] - 1;
        adj[v1].push_back(v2);
        adj[v2].push_back(v1);
    }
    for (int i=0; i<wires.size(); i++) {
        int v1 = wires[i][0] - 1;
        int v2 = wires[i][1] - 1;
        int cnt1 = f(v1, v2);
        int cnt2 = f(v2, v1);
        answer = min(answer, abs(cnt1-cnt2));
    }
    return answer;
}