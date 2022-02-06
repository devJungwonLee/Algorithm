#include <string>
#include <vector>
#include <queue>
#include <map>

using namespace std;

vector<vector<int>> adj;
vector<int> visited, cnt;
queue<int> q;
int dist = 0;

int solution(int n, vector<vector<int>> edge) {
    int answer = 0;
    for (int i=0; i<n; i++) {
        visited.push_back(-1);
        vector<int> tmp;
        adj.push_back(tmp);
    }
    for (int i=0; i<edge.size(); i++) {
        int v1, v2;
        v1 = edge[i][0]-1;
        v2 = edge[i][1]-1;
        adj[v1].push_back(v2);
        adj[v2].push_back(v1);
    }
    visited[0]=0;
    cnt.push_back(1);
    q.push(0);
    while (!q.empty()) {
        int v = q.front();
        q.pop();
        for (int i=0; i<adj[v].size(); i++) {
            int w = adj[v][i];
            if (visited[w]>-1) continue;
            visited[w] = visited[v] + 1;
            if (visited[w] > dist) {
                dist = visited[w];
                cnt.push_back(1);
            } else cnt[visited[w]]++;
            q.push(w);
        }
    }
    answer = cnt[dist];
    return answer;
}