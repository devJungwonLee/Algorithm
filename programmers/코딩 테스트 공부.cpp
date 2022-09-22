#include <string>
#include <vector>
#include <algorithm>
#include <queue>
using namespace std;
int maxAlp = 0, maxCop = 0;
int v[151][151];
queue<pair<int, int>> q;

void bfs(int alp, int cop, vector<vector<int>> &problems) {
    v[alp][cop] = 0;
    q.push(make_pair(alp, cop));
    while (!q.empty()) {
        int a = q.front().first;
        int c = q.front().second;
        q.pop();
        if (a>=maxAlp && c>=maxCop) continue;
        for (auto problem: problems) {
            if (a < problem[0] || c < problem[1]) continue;
            int newa = a + problem[2];
            int newc = c + problem[3];
            newa = min(maxAlp, newa);
            newc = min(maxCop, newc);
            int newt = v[a][c] + problem[4];
            if (newt >= v[newa][newc]) continue;
            v[newa][newc] = newt;
            q.push(make_pair(newa, newc));
        }
    }
}

int solution(int alp, int cop, vector<vector<int>> problems) {
    for (int i=0; i<=150; i++) {
        for (int j=0; j<=150; j++) v[i][j] = 999999999;
    }
    for (auto problem: problems) {
        maxAlp = max(maxAlp, problem[0]);
        maxCop = max(maxCop, problem[1]);
    }
    problems.push_back({0, 0, 1, 0, 1});
    problems.push_back({0, 0, 0, 1, 1});
    bfs(alp, cop, problems);
    return v[maxAlp][maxCop];
}