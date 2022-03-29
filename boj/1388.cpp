#include <iostream>
#include <utility>
#include <queue>
using namespace std;

int N, M, answer = 0;
int dir[4][2] = {{-1,0},{0,1},{1,0},{0,-1}};
char a[50][50];
bool v[50][50];
queue<pair<int, int> > q;

void bfs(pair<int, int> start) {
    v[start.first][start.second] = true;
    q.push(start);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i=0; i<4; i++) {
            if (a[row][col]=='-' && i%2==0) continue;
            if (a[row][col]=='|' && i%2==1) continue;
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<0 || newr>=N || newc<0 || newc>=M) continue;
            if (a[row][col] != a[newr][newc]) continue;
            if (v[newr][newc]) continue;
            v[newr][newc] = true;
            q.push(make_pair(newr, newc));
        }
    }
}

int main(void) {
    scanf("%d %d", &N, &M);
    getchar();
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) scanf("%c", &a[i][j]);
        getchar();
    }
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) {
            if (v[i][j]) continue;
            bfs(make_pair(i, j));
            answer++;
        }
    }
    printf("%d\n", answer);
    return 0;
}