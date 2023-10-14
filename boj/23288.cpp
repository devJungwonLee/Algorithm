#include <iostream>
#include <vector>
#include <utility>
#include <set>
#include <queue>
using namespace std;

int N, M, K, d = 1, points = 0;
int a[20][20], area[20][20];
int dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
int dice[6] = {2, 3, 5, 4, 1, 6};
pair<int, int> p = make_pair(0, 0);
bool visited[20][20];

void move(int d) {
    int rule[4][6] = {
        {4, 1, 5, 3, 2, 0},
        {0, 4, 2, 5, 3, 1},
        {5, 1, 4, 3, 0, 2},
        {0, 5, 2, 4, 1, 3}
    };
    int temp[6];
    for (int i=0; i<6; i++) temp[i] = dice[rule[d][i]];
    for (int i=0; i<6; i++) dice[i] = temp[i];
}

void bfs(int r, int c) {
    queue<pair<int, int> > q;
    vector<pair<int, int> > v;
    visited[r][c] = true;
    v.push_back(make_pair(r, c));
    q.push(make_pair(r, c));

    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr < 0 || newr >= N || newc < 0 || newc >= M) continue;
            if (a[newr][newc] != a[r][c]) continue;
            if (visited[newr][newc]) continue;
            visited[newr][newc] = true;
            v.push_back(make_pair(newr, newc));
            q.push(make_pair(newr, newc));
        }
    }
    for (auto p: v) {
        area[p.first][p.second] = v.size();
    }
}

int main(void) {
    scanf("%d %d %d", &N, &M, &K);
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) {
            scanf("%d", &a[i][j]);
        }
    }
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) {
            if (visited[i][j]) continue;
            bfs(i, j);
        }
    }

    for (int i=0; i<K; i++) {
        int newr = p.first + dir[d][0];
        int newc = p.second + dir[d][1];
        if (newr < 0 || newr >= N || newc < 0 || newc >= M) {
            d = (d + 2) % 4;
            newr = p.first + dir[d][0];
            newc = p.second + dir[d][1];
        }
        move(d);
        p = make_pair(newr, newc);
        points += a[newr][newc] * area[newr][newc];
        if (dice[5] > a[newr][newc]) d = (d + 1) % 4;
        else if (dice[5] < a[newr][newc]) d = (d + 3) % 4;
    }
    printf("%d\n", points);
    return 0;
}