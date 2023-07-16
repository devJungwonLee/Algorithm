#include <string>
#include <vector>
#include <queue>
#include <map>
#include <algorithm>
using namespace std;

struct Node {
    int time;
    int vertex;
    map<int, bool> state;
};

struct compare {
    bool operator()(Node &x, Node &y) {
        return x.time > y.time;
    }
};

priority_queue<Node, vector<Node>, compare> pq;
int a[1001][1001];
map<pair<int, map<int, bool>>, int> dist;

bool getState(map<int, bool> &m, int x) {
    return m.find(x) == m.end() ? false : m[x];
}

int solution(int n, int start, int end, vector<vector<int>> roads, vector<int> traps) {
    int answer = 999999999;
    map<int, bool> state;
    for (auto road: roads) {
        if (a[road[0]][road[1]] == 0) a[road[0]][road[1]] = road[2];
        else a[road[0]][road[1]] = min(a[road[0]][road[1]], road[2]);
    }
    for (auto trap: traps) state[trap] = false;
    dist[make_pair(start, state)] = 0;
    pq.push({0, start, state});
    while (!pq.empty()) {
        Node node = pq.top();
        pq.pop();
        if (node.vertex == end) {
            answer = min(answer, node.time);
            continue;
        }
        for (int i=1; i<=n; i++) {
            if (i == node.vertex) continue;
            bool left = getState(node.state, i);
            bool right = getState(node.state, node.vertex);
            bool flag = left ^ right;
            int time = flag ? a[i][node.vertex] : a[node.vertex][i];
            if (time == 0) continue;
            map<int, bool> newState = node.state;
            if (node.state.find(i) != node.state.end()) newState[i] = !newState[i];
            pair<int, map<int, bool>> p = make_pair(i, newState);
            if (dist.find(p) != dist.end() && node.time + time >= dist[p]) continue;
            if (node.time + time >= answer) continue;
            dist[p] = node.time + time;
            pq.push({node.time + time, i, newState});
        }
    }
    return answer;
}