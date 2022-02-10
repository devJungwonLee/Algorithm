#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int d[100000][4];

int solution(vector<vector<int> > land) {
    int n = land.size(), answer;
    for (int i=0; i<n; i++) {
        for (int j=0; j<4; j++) d[i][j] = land[i][j];
        if (i==0) continue;
        d[i][0] += max(max(d[i-1][1], d[i-1][2]), d[i-1][3]);
        d[i][1] += max(max(d[i-1][0], d[i-1][2]), d[i-1][3]);
        d[i][2] += max(max(d[i-1][0], d[i-1][1]), d[i-1][3]);
        d[i][3] += max(max(d[i-1][0], d[i-1][1]), d[i-1][2]);
    }
    answer = max(max(max(d[n-1][0], d[n-1][1]), d[n-1][2]), d[n-1][3]);
    return answer;
}