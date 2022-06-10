#include <iostream>
#include <utility>
#include <vector>
using namespace std;
typedef pair<int, int> point;


int T, R, C, answer;
char a[400][400];

int main(void) {
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        vector<point> v;
        answer = 0;
        scanf("%d %d", &R, &C);
        getchar();
        for (int i=0; i<R; i++) {
            for (int j=0; j<C; j++) {
                scanf("%c", &a[i][j]);
                if (a[i][j] == 'o') v.push_back(make_pair(i, j));
            }
            getchar();
        }
        for (auto p: v) {
            int row = p.first;
            int col = p.second;
            if (row - 1 >= 0 && a[row-1][col] == 'v' && row + 1 <= R-1 && a[row+1][col] == '^') answer++;
            else if (col - 1 >= 0 && a[row][col-1] == '>' && col + 1 <= C-1 && a[row][col+1] == '<') answer++;
        }
        printf("%d\n", answer);
    }
    return 0;
}