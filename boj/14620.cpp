#include <iostream>
#include <map>
#include <vector>
using namespace std;

int N, a[10][10], answer = 999999999;
map<pair<int, int>, int> cost;
vector<pair<int, int> > v;

int dist(pair<int, int> x, pair<int, int> y) {
    return abs(x.first - y.first) + abs(x.second - y.second);
}

bool check(int i, int j, int k) {
    if (dist(v[i], v[j]) < 3) return false;
    if (dist(v[i], v[k]) < 3) return false;
    if (dist(v[j], v[k]) < 3) return false;
    return true;
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) scanf("%d", &a[i][j]);
    }
    for (int i=1; i<N-1; i++) {
        for (int j=1; j<N-1; j++) {
            int sum = 0;
            sum += a[i][j];
            sum += a[i-1][j];
            sum += a[i][j-1];
            sum += a[i][j+1];
            sum += a[i+1][j];
            cost[make_pair(i, j)] = sum;
            v.push_back(make_pair(i, j));
        }
    }
    for (int i=0; i<v.size(); i++) {
        for (int j=i+1; j<v.size(); j++) {
            for (int k=j+1; k<v.size(); k++) {
                bool result = check(i, j, k);
                if (!result) continue;
                int sum = cost[v[i]] + cost[v[j]] + cost[v[k]];
                answer = min(answer, sum);
            }
        }
    }
    printf("%d\n", answer);
    return 0;
}