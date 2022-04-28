#include <iostream>
#include <utility>
#include <queue>
using namespace std;

int W, H, mirror[100][100];
int dir[4][2] = {{-1,0},{0,1},{1,0},{0,-1}};
pair<int, int> s, e;
queue<pair<int, int> > q;
char a[100][100];
bool first = true;

void bfs() {
    q.push(s);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        if (make_pair(row, col) == e) break;
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            while (newr>=0 && newr<H && newc>=0 && newc<W && a[newr][newc] != '*') {
                if (mirror[newr][newc]==-1) {
                    mirror[newr][newc] = mirror[row][col] + 1;
                    q.push(make_pair(newr, newc));
                }
                newr = newr + dir[i][0];
                newc = newc + dir[i][1];
            }
        }
        if (make_pair(row, col) == s) mirror[row][col] = 0;
    }
}

int main(void) {
    scanf("%d %d", &W, &H);
    getchar();
    for (int i=0; i<H; i++) {
        for (int j=0; j<W; j++) {
            scanf("%c", &a[i][j]);
            if (a[i][j]=='C') {
                if (first) {
                    s = make_pair(i, j);
                    first = false;
                } else e = make_pair(i, j); 
            }
            mirror[i][j] = -1;
        }
        getchar();
    }
    bfs();
    printf("%d\n", mirror[e.first][e.second]);
    return 0;
}