#include <string>
#include <vector>
#include <queue>
#include <map>
using namespace std;

vector<int> adj[100001];
map<int, int> dist;
queue<int> q;

void bfs(int n, int start) {
    dist[start] = 0;
    q.push(start);
    while (!q.empty()) {
        int x = q.front();
        q.pop();
        for (auto y: adj[x]) {
            if (dist.find(y) != dist.end()) continue;
            dist[y] = dist[x] + 1;
            q.push(y);
        }
    }
}

vector<int> solution(int n, vector<vector<int>> roads, vector<int> sources, int destination) {
    vector<int> answer;
    for (auto road: roads) {
        int v1 = road[0];
        int v2 = road[1];
        adj[v1].push_back(v2);
        adj[v2].push_back(v1);
    }
    bfs(n, destination);
    for (auto source: sources) {
        if (dist.find(source) == dist.end()) answer.push_back(-1);
        else answer.push_back(dist[source]);
    }
    return answer;
}