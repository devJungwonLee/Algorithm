#include <iostream>
#include <queue>
#include <vector>
using namespace std;

int n, m = 0, answer = 0, startTime[101];
vector<pair<int, int> > adj[101];

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> n;
    for (int i=1; i<=n; i++) {
        int c, t;
        cin >> c >> t;
        m = max(m, c);
        adj[c].push_back(make_pair(i, t));
    }
    for (int c=1; c<m; c++) {
        for (auto y: adj[c+1]) {
            int maxValue = 0;
            int j = y.first;
            for (auto x: adj[c]) {
                int i = x.first;
                int t = x.second;
                maxValue = max(maxValue, startTime[i] + t + (i-j)*(i-j));
            }
            startTime[j] = maxValue;
        }
    }
    for (auto x: adj[m]) {
        answer = max(answer, startTime[x.first] + x.second);
    }
    cout << answer << "\n";
    return 0;
}