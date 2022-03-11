#include <string>
#include <vector>

using namespace std;

int solution(vector<vector<int>> matrix_sizes) {
    int n = matrix_sizes.size(), inf = 2000000000, d[200][200];
    for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) d[i][j] = inf;
    }
    for (int diff=0; diff<n; diff++) {
        for (int start=0; start+diff<n; start++) {
            int end = start+diff;
            if (diff==0) {
                d[start][end] = 0;
                continue;
            }
            for (int mid=start; mid<end; mid++) {
                int sum = d[start][mid] + d[mid+1][end];
                int a = matrix_sizes[start][0];
                int b = matrix_sizes[mid][1];
                int c = matrix_sizes[end][1];
                sum += a*b*c;
                d[start][end] = min(d[start][end], sum);
            }
        }
    }
    return d[0][n-1];
}