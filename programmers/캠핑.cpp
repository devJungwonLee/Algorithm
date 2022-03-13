#include <vector>
#include <set>
#include <algorithm>
using namespace std;

int solution(int n, vector<vector<int>> data) {
    set<int> xset, yset;
    vector<int> x, y;
    int dp[5000][5000];
    
    for (auto d: data) {
        xset.insert(d[0]);
        yset.insert(d[1]);
    }
    for (auto element: xset) x.push_back(element);
    for (auto element: yset) y.push_back(element);
    sort(x.begin(), x.end());
    sort(y.begin(), y.end());
    for (int i=0; i<x.size(); i++) {
        for (int j=0; j<y.size(); j++) dp[i][j] = 0;
    }
    for (auto &d: data) {
        for (int i=0; i<x.size(); i++) {
            if (x[i]==d[0]) d[0] = i;
        }
        for (int i=0; i<y.size(); i++) {
            if (y[i]==d[1]) d[1] = i;
        }
        dp[d[0]][d[1]] = 1;
    }
    for (int i=0; i<x.size(); i++) {
        for (int j=0; j<y.size(); j++) {
            if (i>0) dp[i][j] += dp[i-1][j];
            if (j>0) dp[i][j] += dp[i][j-1];
            if (i>0 && j>0) dp[i][j] -= dp[i-1][j-1];
        }
    }
    int answer = 0;
    for (int i=0; i<data.size(); i++) {
        for (int j=i+1; j<data.size(); j++) {
            vector<int> p1 = data[i], p2 = data[j];
            if (p1[0] == p2[0] || p1[1] == p2[1]) continue;
            int r1 = min(p1[0], p2[0]);
            int r2 = max(p1[0], p2[0]) - 1;
            int c1 = min(p1[1], p2[1]);
            int c2 = max(p1[1], p2[1]) - 1;
            int cnt = dp[r2][c2] - dp[r1][c2] - dp[r2][c1] + dp[r1][c1];
            if (cnt == 0) answer++;
        }
    }
    return answer;
}