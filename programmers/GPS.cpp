#include <vector>
#include <algorithm>
using namespace std;

int solution(int n, int m, vector<vector<int>> edge_list, int k, vector<int> gps_log) {
    vector<int> a[201];
    int d[100][201];
    int inf = 1e9;
    for (int i=0; i<m; i++) {
        int v1 = edge_list[i][0];
        int v2 = edge_list[i][1];
        a[v1].push_back(v2);
        a[v2].push_back(v1);
    }
    for (int i=0; i<k; i++) {
        for (int j=1; j<=n; j++) {
            if (i==0) {
                if (j==gps_log[i]) d[i][j] = 0;
                else d[i][j] = inf;
            } else {
                int minValue = min(d[i-1][j], inf);
                for (int x=0; x<a[j].size(); x++) {
                    int v = a[j][x];
                    minValue = min(minValue, d[i-1][v]);
                }
                d[i][j] = minValue + (j==gps_log[i] ? 0 : 1);
            }
        }
    }
    if (d[k-1][gps_log[k-1]]>=inf) return -1;
    else return d[k-1][gps_log[k-1]];
}