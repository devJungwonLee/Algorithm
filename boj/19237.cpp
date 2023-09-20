#include <iostream>
#include <utility>
#include <set>
using namespace std;

int N, M, K, answer = -1, a[20][20], sd[401], dir[401][4][4];
pair<int, int> sharks[401], smell[20][20];
set<int> died;

int main(void) {
    int delta[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    scanf("%d %d %d", &N, &M, &K);
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            scanf("%d", &a[i][j]);
            if (a[i][j] > 0) {
                sharks[a[i][j]] = make_pair(i, j);
                smell[i][j] = make_pair(a[i][j], K);
            }
        }
    }
    for (int i=1; i<=M; i++) {
        scanf("%d", &sd[i]);
        sd[i]--;
    }
    for (int i=1; i<=M; i++) {
        for (int j=0; j<4; j++) {
            for (int k=0; k<4; k++) {
                scanf("%d", &dir[i][j][k]);
                dir[i][j][k]--;
            }
        }
    }
    for (int t=1; t<=1000; t++) {
        for (int s=1; s<=M; s++) {
            if (died.find(s) != died.end()) continue;
            int d = sd[s];
            int row = sharks[s].first;
            int col = sharks[s].second;
            bool moved = false;
            for (int k=0; k<4; k++) {
                int newd = dir[s][d][k];
                int newr = row + delta[newd][0];
                int newc = col + delta[newd][1];
                if (newr < 0 || newr >= N || newc < 0 || newc >= N) continue;
                if (smell[newr][newc].first != 0) continue;
                if (a[newr][newc] != 0) {
                    a[row][col] = 0;
                    died.insert(s);
                } else {
                    a[row][col] = 0;
                    a[newr][newc] = s;
                    sd[s] = newd;
                    sharks[s] = make_pair(newr, newc);
                }
                moved = true;
                break;
            }
            if (moved) continue;
            for (int k=0; k<4; k++) {
                int newd = dir[s][d][k];
                int newr = row + delta[newd][0];
                int newc = col + delta[newd][1]; 
                if (newr < 0 || newr >= N || newc < 0 || newc >= N) continue;
                if (smell[newr][newc].first != s) continue;
                a[row][col] = 0;
                a[newr][newc] = s;
                sd[s] = newd;
                sharks[s] = make_pair(newr, newc);
                moved = true;
                break;
            }
        }
        for (int i=0; i<N; i++) {
            for (int j=0; j<N; j++) {
                if (a[i][j] > 0) {
                    smell[i][j] = make_pair(a[i][j], K);
                } else if (smell[i][j].first > 0 && smell[i][j].second > 0) {
                    smell[i][j].second--;
                    if (smell[i][j].second == 0) smell[i][j].first = 0;
                }
            }
        }
        if (died.size() == M-1) {
            answer = t;
            break;
        }
    }
    printf("%d\n", answer);
    return 0;
}