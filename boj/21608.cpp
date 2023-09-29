#include <iostream>
#include <vector>
#include <set>
#include <cmath>
using namespace std;

int N, a[20][20], dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
set<int> fav[401];
vector<int> order;
pair<int, int> p;
int friends = -1, emptySeats = -1, sum = 0;

pair<int, int> calculate(int i, int j, int x) {
    int e = 0, f = 0;
    for (int d=0; d<4; d++) {
        int r = i + dir[d][0];
        int c = j + dir[d][1];
        if (r < 0 || r >= N || c < 0 || c >= N) continue;
        if (a[r][c] == 0) e++;
        else if (fav[x].find(a[r][c]) != fav[x].end()) f++;
    }
    return make_pair(f, e);
}

bool check(pair<int, int> result) {
    if (result.first > friends) return true;
    else if (result.first < friends) return false;
    if (result.second > emptySeats) return true;
    else return false;
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N*N; i++) {
        int x, y;
        scanf("%d", &x);
        order.push_back(x);
        for (int j=0; j<4; j++) {
            scanf("%d", &y);
            fav[x].insert(y);
        }
    }
    for (auto x: order) {
        friends = -1;
        emptySeats = -1;
        for (int i=0; i<N; i++) {
            for (int j=0; j<N; j++) {
                if (a[i][j] > 0) continue;
                pair<int, int> result = calculate(i, j, x);
                if (check(result)) {
                    p = make_pair(i, j);
                    friends = result.first;
                    emptySeats = result.second;
                }
            }
        }
        a[p.first][p.second] = x;
    }
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            pair<int, int> result = calculate(i, j, a[i][j]);
            sum += (int)pow(10, result.first - 1);
        }
    }
    printf("%d\n", sum);
    return 0;
}