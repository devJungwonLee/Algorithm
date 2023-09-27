#include <iostream>
#include <utility>
#include <vector>
using namespace std;

int N, sand[500][500], d = 0, answer = 0;
int dir[4][2] = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}};
pair<int, int> x, e = make_pair(0, 0);
vector<int> uppers;

void move(pair<int, int> &from, int d, int delta) {
    from.first += dir[d][0] * delta;
    from.second += dir[d][1] * delta;
}

void turnLeft(int &d) {
    d = (d + 1) % 4;
}

void turnRight(int &d) {
    d = (d + 3) % 4;
}

vector<pair<pair<int, int>, double> > findTargets(pair<int, int> from, int d) {
    vector<pair<pair<int, int>, double> > result;
    pair<int, int> c = from;
    int tempd = d;
    move(c, tempd, 3);
    result.push_back({c, 0.05});
    c = from;
    tempd = d;
    move(c, tempd, 2);
    turnRight(tempd);
    move(c, tempd, 1);
    result.push_back({c, 0.1});
    c = from;
    tempd = d;
    move(c, tempd, 2);
    turnLeft(tempd);
    move(c, tempd, 1);
    result.push_back({c, 0.1});
    c = from;
    tempd = d;
    move(c, tempd, 1);
    turnRight(tempd);
    move(c, tempd, 1);
    result.push_back({c, 0.07});
    move(c, tempd, 1);
    result.push_back({c, 0.02});
    c = from;
    tempd = d;
    move(c, tempd, 1);
    turnLeft(tempd);
    move(c, tempd, 1);
    result.push_back({c, 0.07});
    move(c, tempd, 1);
    result.push_back({c, 0.02});
    c = from;
    tempd = d;
    turnRight(tempd);
    move(c, tempd, 1);
    result.push_back({c, 0.01});
    c = from;
    tempd = d;
    turnLeft(tempd);
    move(c, tempd, 1);
    result.push_back({c, 0.01});
    return result;
}

int main(void) {
    scanf("%d", &N);
    int upper = 0, idx = 0;
    for (int t=0; upper < N*N; t++) {
        upper += t / 2 + 1;
        uppers.push_back(upper);
    }
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) scanf("%d", &sand[i][j]);
    }
    x = make_pair(N/2, N/2);
    for (int t = 1; x != e; t++) {
        pair<int, int> y = x;
        move(y, d, 1);
        int remain = sand[y.first][y.second];
        vector<pair<pair<int, int>, double> > targets = findTargets(x, d);
        for (auto target: targets) {
            pair<int, int> p = target.first;
            double ratio = target.second;
            int part = int(sand[y.first][y.second] * ratio);
            remain -= part;
            if (p.first < 0 || p.first >= N || p.second < 0 || p.second >= N) {
                answer += part;
            } else {
                sand[p.first][p.second] += part;
            }
        }
        sand[y.first][y.second] = 0;
        pair<int, int> alpha = y;
        move(alpha, d, 1);
        if (alpha.first < 0 || alpha.first >= N || alpha.second < 0 || alpha.second >= N) {
            answer += remain;
        } else {
            sand[alpha.first][alpha.second] += remain;
        }
        x = y;
        if (t == uppers[idx]) {
            turnLeft(d);
            idx++;
        }
    }
    printf("%d\n", answer);
    return 0;
}