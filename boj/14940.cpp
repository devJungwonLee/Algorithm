#include <iostream>
#include <utility>
#include <queue>
using namespace std;

int n, m, a[1000][1000], d[1000][1000];
pair<int, int> start;
queue<pair<int, int>> q;

void bfs() {
    int dir[4][2] = {{-1,0},{0,1},{1,0},{0,-1}};
    d[start.first][start.second] = 1;
    q.push(start);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<0 || newr>=n || newc<0 || newc>=m) continue;
            if (a[newr][newc]==0 || d[newr][newc]>0) continue;
            d[newr][newc] = d[row][col] + 1;
            q.push(make_pair(newr, newc));
        }
    }
}

int main(void) {
    scanf("%d %d", &n, &m);
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            scanf("%d", &a[i][j]);
            if (a[i][j]==2) start = make_pair(i, j);
            if (a[i][j]==0) d[i][j] = 0;
            else d[i][j] = -1;
        }
    }
    bfs();
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            if (d[i][j]>0) printf("%d ", d[i][j]-1);
            else printf("%d ", d[i][j]);
        }
        printf("\n");
    }
    return 0;
}
