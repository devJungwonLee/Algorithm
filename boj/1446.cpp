#include <iostream>
#include <map>
#include <utility>
#include <vector>
#include <algorithm>
using namespace std;

map<pair<int, int>, int> shortDist;
map<int, vector<int>> road;
int dp[10001];

int main(void) {
    int n, d;
    scanf("%d %d", &n, &d);
    for (int i=0; i<=d; i++) dp[i] = 100000;
    for (int i=0; i<n; i++) {
        int v1, v2, dist;
        scanf("%d %d %d", &v1, &v2, &dist);
        road[v1].push_back(v2);
        pair<int, int> p = make_pair(v1, v2);
        if (shortDist.find(p) == shortDist.end()) shortDist[p] = dist;
        else shortDist[p] = min(shortDist[p], dist);
    }
    dp[0] = 0;
    for (int i=0; i<d; i++) {
        for (auto j: road[i]) {
            dp[j] = min(dp[j], dp[i] + shortDist[make_pair(i, j)]);
        }
        dp[i+1] = min(dp[i+1], dp[i] + 1);
    }
    printf("%d\n", dp[d]);
    return 0;
}