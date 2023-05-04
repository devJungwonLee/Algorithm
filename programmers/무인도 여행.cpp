#include <string>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

int n, m;
queue<pair<int, int>> q;
bool v[100][100];

int bfs(pair<int, int> p, vector<string> &maps) {
    int dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
    int sum = 0;
    
    sum += maps[p.first][p.second] - '0';
    v[p.first][p.second] = true;
    q.push(p);
    
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr < 0 || newr >= n || newc < 0 || newc >= m) continue;
            if (maps[newr][newc] == 'X' || v[newr][newc]) continue;
            sum += maps[newr][newc] - '0';
            v[newr][newc] = true;
            q.push(make_pair(newr, newc));
        }
    }
    return sum;
}

vector<int> solution(vector<string> maps) {
    vector<int> answer;
    n = maps.size();
    m = maps[0].size();
    
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            if (maps[i][j] == 'X' || v[i][j]) continue;
            answer.push_back(bfs(make_pair(i, j), maps));
        }
    }
    
    if (answer.empty()) answer.push_back(-1);
    else sort(answer.begin(), answer.end());
    return answer;
}