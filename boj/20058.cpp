#include <iostream>
#include <cmath>
#include <algorithm>
#include <queue>
#include <utility>
using namespace std;

int N, Q, M, sum = 0, maxValue = 0;
int a[64][64], L[1000];
int dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
bool v[64][64];
queue<pair<int, int> > q;

void rotate(int l) {
    int m = (int)pow(2, l);
    for (int i=0; i<M; i+=m) {
        for (int j=0; j<M; j+=m) {
            vector<vector<int> > v;
            for (int q=0; q<m; q++) {
                vector<int> w;
                for (int p=m-1; p>=0; p--) w.push_back(a[i+p][j+q]);
                v.push_back(w);
            }
            for (int p=0; p<m; p++) {
                for (int q=0; q<m; q++) {
                    a[i+p][j+q] = v[p][q];
                }
            }
        }
    }
}

bool check(int p, int q) {
    if (a[p][q] == 0) return true;
    int count = 0;
    for (int i=0; i<4; i++) {
        int newp = p + dir[i][0];
        int newq = q + dir[i][1];
        if (newp < 0 || newp >= M || newq < 0 || newq >= M) continue;
        if (a[newp][newq] == 0) continue;
        count++;
    }
    return count >= 3;
}

pair<int, int> bfs(int i, int j) {
    int s = 0, c = 0;
    v[i][j] = true;
    q.push(make_pair(i, j));
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        s+=a[row][col];
        c++;
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr < 0 || newr >= M || newc < 0 || newc >= M) continue;
            if (a[newr][newc] == 0 || v[newr][newc]) continue;
            v[newr][newc] = true;
            q.push(make_pair(newr, newc));
        }
    }
    return make_pair(s, c);
}

int main(void) {
    scanf("%d %d", &N, &Q);
    M = (int)pow(2, N);
    for (int i=0; i<M; i++) {
        for (int j=0; j<M; j++) scanf("%d", &a[i][j]);
    }
    for (int i=0; i<Q; i++) scanf("%d", &L[i]);
    for (int k=0; k<Q; k++) {
        int l = L[k];
        rotate(l);
        vector<pair<int, int> > erase;
        for (int i=0; i<M; i++) {
            for (int j=0; j<M; j++) {
                bool result = check(i, j);
                if (!result) erase.push_back(make_pair(i, j));
            }
        }
        for (auto p: erase) a[p.first][p.second]--;
    }
    for (int i=0; i<M; i++) {
        for (int j=0; j<M; j++) {
            if (a[i][j] == 0 || v[i][j]) continue;
            pair<int, int> result = bfs(i, j);
            sum += result.first;
            maxValue = max(maxValue, result.second);
        }
    }
    printf("%d\n", sum);
    printf("%d\n", maxValue);
    return 0;
}