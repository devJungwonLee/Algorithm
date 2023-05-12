#include <string>
#include <vector>
#include <queue>
#include <map>
using namespace std;

int bfs(vector<string> &maps, pair<int, int> start, pair<int ,int> end) {
    queue<pair<int, int>> q;
    map<pair<int, int>, int> m;
    int dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
    int N = maps.size();
    int M = maps[0].size();
    
    m[start] = 0;
    q.push(start);
    
    while (!q.empty()) {
        pair<int, int> p = q.front();
        int row = p.first;
        int col = p.second;
        q.pop();
        if (p == end) return m[p];
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr < 0 || newr >= N || newc < 0 || newc >= M) continue;
            if (maps[newr][newc] == 'X') continue;
            pair<int, int> newp = make_pair(newr, newc);
            if (m.find(newp) != m.end()) continue;
            m[newp] = m[p] + 1;
            q.push(newp);
        }
    }
    return -1;
}

int solution(vector<string> maps) {
    int answer = 0;
    pair<int, int> start, lever, end;
    for (int i=0; i<maps.size(); i++) {
        for (int j=0; j<maps[i].size(); j++) {
            if (maps[i][j] == 'S') start = make_pair(i, j);
            else if (maps[i][j] == 'L') lever = make_pair(i, j);
            else if (maps[i][j] == 'E') end = make_pair(i, j);
        }
    }
    
    int d1 = bfs(maps, start, lever);
    if (d1 == -1) return -1;
    int d2 = bfs(maps, lever, end);
    if (d2 == -1) return -1;
    return d1 + d2;
}