#include <string>
#include <vector>

using namespace std;
int a[101][101], cnt[101];

int solution(int n, vector<vector<int>> results) {
    int answer = 0;
    for (int i=1; i<=n; i++) {
        a[i][i]=2;
        cnt[i]++;
    }
    for (int i=0; i<results.size(); i++) {
        int from = results[i][0];
        int to = results[i][1];
        a[from][to] = 1;
        a[to][from] = 2;
        cnt[from]++;
        cnt[to]++;
    }
    for (int k=1; k<=n; k++) {
        for (int i=1; i<=n; i++) {
            for (int j=1; j<=n; j++) {
                if (a[i][j]!=0) continue;
                if (a[i][k]==1&&a[k][j]==1) {
                    a[i][j]=1;
                    a[j][i]=2;
                    cnt[i]++;
                    cnt[j]++;
                }
            }
        }
    }
    for (int i=1; i<=n; i++) {
        if (cnt[i]==n) answer++;
    }
    return answer;
}