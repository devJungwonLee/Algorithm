#include <iostream>
#include <vector>
#include <utility>
#include <queue>
using namespace std;

int N, M, a[100][100], cnt = 0, answer = 0;
bool exposed[100][100];
int dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
queue<pair<int, int> > q;

void checkAir(int i, int j) {
    exposed[i][j] = true;
    q.push(make_pair(i, j));
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<0 || newr>=N || newc<0 || newc>=M) continue;
            if (a[newr][newc] != 0 || exposed[newr][newc]) continue;
            exposed[newr][newc] = true;
            q.push(make_pair(newr, newc));
        }
    }
}

int main(void) {
    scanf("%d %d", &N, &M);
    for (int i=0; i<N; i++) {
        for (int j=0; j<M; j++) {
            scanf("%d", &a[i][j]);
            if (a[i][j] == 1) cnt++;
        }
    }
    
    checkAir(0, 0);
    while (cnt > 0) {
        vector<pair<int, int> > v;
        for (int i=0; i<N; i++) {
            for (int j=0; j<M; j++) {
                if (a[i][j] != 1) continue;
                int touch = 0;
                for (int k=0; k<4; k++) {
                    int row = i + dir[k][0];
                    int col = j + dir[k][1];
                    if (a[row][col] == 0 && exposed[row][col]) touch++;
                }
                if (touch >= 2) v.push_back(make_pair(i, j));
            }
        }
        for (auto x: v) {
            a[x.first][x.second] = 0;
            cnt--;
            checkAir(x.first, x.second);
        }
        answer++;
    }
    printf("%d\n", answer);
    return 0;
}