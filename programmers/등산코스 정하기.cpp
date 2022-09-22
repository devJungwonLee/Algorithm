#include <string>
#include <vector>
#include <iostream>
#include <queue>
#include <utility>
#include <algorithm>
using namespace std;
vector<pair<int, int> > adj[50001];
int info[50001], d[50001];

int bfs(int summit, int n) {
    queue<int> q;
    int answer = 99999999;
    d[summit] = 0;
    q.push(summit);
    while (!q.empty()) {
        int x = q.front();
        q.pop();
        if (info[x] == 1) {
            answer = min(answer, d[x]);
            continue;
        }
        for (auto p: adj[x]) {
            int y = p.first;
            if (info[y] == 2) continue;
            int w = p.second;
            int intensity = max(d[x], w);
            if (intensity < d[y]) {
                d[y] = intensity;
                q.push(y);
            }
        }
    }
    return answer;
}

vector<int> solution(int n, vector<vector<int>> paths, vector<int> gates, vector<int> summits) {
    vector<int> answer;
    for (auto gate: gates) info[gate] = 1;
    for (auto summit: summits) info[summit] = 2;
    int minIntensity = 99999999;
    int answerSummit = 0;
    sort(summits.begin(), summits.end());
    fill(d, d+n+1, 99999999);
    
    for (auto path: paths) {
        int i = path[0];
        int j = path[1];
        int w = path[2];
        adj[i].push_back(make_pair(j, w));
        adj[j].push_back(make_pair(i, w));
    }
    
    for (auto summit: summits) {
        int intensity = bfs(summit, n);
        if (intensity < minIntensity) {
            minIntensity = intensity;
            answerSummit = summit;
        }
    }
    answer.push_back(answerSummit);
    answer.push_back(minIntensity);
    return answer;
}