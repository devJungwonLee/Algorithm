#include <iostream>
using namespace std;

int R, C, answer = 0;
int dir[3][2] = {{-1,1}, {0, 1}, {1,1}};
char a[10000][500];
bool v[10000][500];

bool pipe(int i, int j) {
    v[i][j] = true;
    if (j==C-1) return true;
    bool result = false;
    for (int d=0; d<3; d++) {
        int newi = i + dir[d][0];
        int newj = j + dir[d][1];
        if (newi<0 || newi>=R || newj<0 || newj>=C) continue;
        if (a[newi][newj]=='x' || v[newi][newj]) continue;
        result = pipe(newi, newj);
        if (result) {
            return true;
        }
    }
    return false;
}

int main(void) {
    scanf("%d %d", &R, &C);
    getchar();
    for (int i=0; i<R; i++) {
        for (int j=0; j<C; j++) scanf("%c", &a[i][j]);
        getchar();
    }
    for (int i=0; i<R; i++) {
        if(pipe(i, 0)) answer++;
    }
    printf("%d\n", answer);
    return 0;
}