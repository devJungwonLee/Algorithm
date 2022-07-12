#include <iostream>
#include <utility>
#include <queue>
using namespace std;

int H, W, N, answer = 0;
char a[1000][1000];
int v[1000][1000];

int bfs(pair<int, int> start, pair<int, int> end) {
    queue<pair<int, int> > q;
    int dir[4][2] = {{-1,0}, {0,1}, {1,0}, {0,-1}};
    for (int i=0; i<H; i++) {
        for (int j=0; j<W; j++) v[i][j] = 0;
    }
    v[start.first][start.second] = 1;
    q.push(start);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        if (make_pair(row, col) == end) {
            return v[row][col] - 1;
        }
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<0 || newr>=H || newc<0 || newc>=W) continue;
            if (v[newr][newc]!=0 || a[newr][newc]=='X') continue;
            v[newr][newc] = v[row][col] + 1;
            q.push(make_pair(newr, newc));
        }
    }
    return 0;
}

int main(void) {
    char c;
    pair<int, int> p[10];
    scanf("%d %d %d", &H, &W, &N);
    getchar();
    for (int i=0; i<H; i++) {
        for (int j=0; j<W; j++) {
            scanf("%c", &a[i][j]);
            if (a[i][j] == 'S') p[0] = make_pair(i, j); 
            else if (a[i][j] >= '1' && a[i][j] <= '9') {
                p[a[i][j]-'0'] = make_pair(i, j);
            }
        }
        getchar();
    }
    for (int i=0; i<N; i++) answer += bfs(p[i], p[i+1]);
    printf("%d\n", answer);
    return 0;
}