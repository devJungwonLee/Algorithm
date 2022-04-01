#include <iostream>
using namespace std;

bool d[501][501];

int main(void) {
    int n, m, answer = 0;
    scanf("%d %d", &n, &m);
    for (int i=0; i<m; i++) {
        int v1, v2;
        scanf("%d %d", &v1, &v2);
        d[v1][v2] = true;
    }
    for (int k=1; k<=n; k++) {
        for (int i=1; i<=n; i++) {
            for (int j=1; j<=n; j++) {
                if (i==k || k==j) continue;
                if (d[i][k] && d[k][j]) d[i][j] = true;
            }
        }
    }
    for (int i=1; i<=n; i++) {
        int sum = 0;
        for (int j=1; j<=n; j++) {
            if (d[i][j] || d[j][i]) sum++; 
        }
        if (sum==n-1) answer++;
    }
    printf("%d\n", answer);
    return 0;
}