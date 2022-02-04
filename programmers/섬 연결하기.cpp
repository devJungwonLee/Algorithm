#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int parent[100], rnk[100];

bool cmp(vector<int> &a, vector<int> &b) {
    return a[2] < b[2];
}

int find(int x) {
    if (x == parent[x]) return x;
    return parent[x] = find(parent[x]);
}

void merge(int x, int y) {
    x = find(x);
    y = find(y);
    if (x==y) return;
    if (rnk[x] > rnk[y]) parent[y] = x;
    else parent[x] = y;
    if (rnk[x] == rnk[y]) rnk[y]++;
}

int solution(int n, vector<vector<int>> costs) {
    int answer = 0;
    for (int i=0; i<n; i++) {
        parent[i] = i;
        rnk[i] = 1;
    }
    
    sort(costs.begin(), costs.end(), cmp);
    for (int i=0; i<costs.size(); i++) {
        int x = costs[i][0];
        int y = costs[i][1];
        if (find(x) == find(y)) continue;
        merge(x, y);
        answer += costs[i][2];
    }
    
    return answer;
}