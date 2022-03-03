#include <string>
#include <vector>

using namespace std;

int solution(vector<vector<int>> board, vector<vector<int>> skill) {
    int answer = 0;
    int n = board.size();
    int m = board[0].size();
    int **a = new int*[n];
    for (int i=0; i<n; i++) {
        a[i] = new int[m];
        for (int j=0; j<m; j++) a[i][j] = 0;
    }
    for (auto s : skill) {
        int r1 = s[1], c1 = s[2], r2 = s[3], c2 = s[4];
        int d = s[5] * ( 2 * s[0] - 3);
        a[r1][c1] += d;
        if (c2+1 < m) a[r1][c2+1] += -d;
        if (r2+1 < n) a[r2+1][c1] += -d;
        if (c2+1 < m && r2+1 < n) a[r2+1][c2+1] += d;
    }
    for (int i=0; i<n; i++) {
        for (int j=0; j<m; j++) {
            if (i>0) a[i][j] += a[i-1][j];
            if (j>0) a[i][j] += a[i][j-1];
            if (i>0 && j>0) a[i][j] -= a[i-1][j-1];
            if (board[i][j] + a[i][j] > 0) answer++;
        }
    }
    return answer;
}