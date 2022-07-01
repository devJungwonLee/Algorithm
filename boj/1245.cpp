#include <iostream>
#include <utility>
#include <queue>
using namespace std;

int N, M, a[100][70], answer=0;
bool v[100][70];

bool bfs(pair<int, int> p) {
    bool result = true;
    queue<pair<int, int> > q;
    v[p.first][p.second] = true;
    q.push(p);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i=-1; i<=1; i++) {
            for (int j=-1; j<=1; j++) {
                if (i==0&&j==0) continue;
                int newr = row + i;
                int newc = col + j;
                if (newr<0 || newr>=N || newc<0 || newc>=M) continue;
                if (a[newr][newc]>a[row][col]) result = false;
                if (v[newr][newc]) continue;
                if (a[newr][newc]==a[row][col]) {
                    v[newr][newc] = true;
                    q.push(make_pair(newr, newc));
                }
            }
        }
    }
    return result;
}

int main(void) {
    scanf("%d %d", &N, &M);
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) {
            scanf("%d", &a[i][j]);
        }
    }
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) {
            if (v[i][j]) continue;
            bool result = bfs(make_pair(i, j));
            if (result) answer++;
        }
    }
    printf("%d\n", answer);
    return 0;
}