#include <iostream>
#include <utility>
#include <queue>
using namespace std;

int N, M, a[50][50], answer = 0;
bool v[50][50][10];
typedef pair<int, int> point;

void bfs(point p, int k) {
    queue<point> q;
    bool isOutside = false;
    int area = 0, dir[4][2] = {{-1,0},{0,1},{1,0},{0,-1}};
    v[p.first][p.second][k] = true;
    q.push(p);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        area++;
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<0 || newr>=N || newc<0 || newc>=M) {
                isOutside = true;
                continue;
            }
            if (v[newr][newc][k] || a[newr][newc]>k) continue;
            v[newr][newc][k] = true;
            q.push(make_pair(newr, newc));
        }
    }
    if (!isOutside) answer += area;
}

int main(void) {
    char c;
    scanf("%d %d", &N, &M);
    getchar();
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) {
            scanf("%c", &c);
            a[i][j] = c - '0';
        }
        getchar();
    }
    for (int k=1; k<=9; k++) {
        for (int i=0; i<N; i++) {
            for (int j=0; j<M; j++) {
                if (!v[i][j][k] && a[i][j]<=k) {
                    bfs(make_pair(i, j), k);
                }
            }
        }
    }
    printf("%d\n", answer);
    return 0;
}