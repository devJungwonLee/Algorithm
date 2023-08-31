#include <iostream>
#include <vector>
#include <algorithm>
#include <queue>
using namespace std;

int R, C, N, answer = -1;
int v[1000][1000];
vector<vector<int> > a;
vector<vector<int> > dir;

int bfs() {
    queue<pair<int, int> > q;
    for (int j=0; j<C; j++) {
        if (a[0][j] != 1) continue;
        v[0][j] = 0;
        q.push(make_pair(0, j));
    }
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        if (row == R-1) return v[row][col];
        for (auto d: dir) {
            int newr = row + d[0];
            int newc = col + d[1];
            if (newr < 0 || newr >= R || newc < 0 || newc >= C) continue;
            if (a[newr][newc] != 1) continue;
            if (v[newr][newc] == -1 || v[row][col] + 1 < v[newr][newc]) {
                v[newr][newc] = v[row][col] + 1;
                q.push(make_pair(newr, newc));
            }
        }
    }
    return -1;
}

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> R >> C;
    for (int i=0; i<R; i++) {
        vector<int> oneLine;
        for (int j=0; j<C; j++) {
            int num;
            cin >> num;
            oneLine.push_back(num);
            v[i][j] = -1;
        }
        a.push_back(oneLine);
    }
    cin >> N;
    for (int i=0; i<N; i++) {
        vector<int> temp;
        int x, y;
        cin >> x >> y;
        temp.push_back(x);
        temp.push_back(y);
        dir.push_back(temp);
    }
    
    answer = bfs();
    cout << answer << "\n";
    return 0;
}