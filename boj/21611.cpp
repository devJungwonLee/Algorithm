#include <iostream>
#include <utility>
#include <vector>
using namespace std;

int N, M, a[100][100], marbles[3000], temp[3000], exploded[3];

void makeNumber() {
    int dir[4][2] = {{0, -1}, {1, 0}, {0, 1}, {-1, 0}};
    int t = 1, delta = 1, count = 0, d = 0;
    pair<int, int> p = make_pair(N/2, N/2);
    for (int num = 1; num < N * N; num++) {
        int row = p.first + dir[d][0];
        int col = p.second + dir[d][1];
        a[row][col] = num;
        if (num == t) {{
            d = (d + 1) % 4;
            count++;
            if (count == 2) {
                delta++;
                count = 0;
            }
            t += delta;
        }}
        p = make_pair(row, col);
    }
}

void move() {
    int k = 1;
    for (int i=1; i<N*N; i++) {
        if (marbles[i] > 0) temp[k++] = marbles[i];
    }
    for (int i=1; i<k; i++) marbles[i] = temp[i];
    for (int i=k; i<N*N; i++) marbles[i] = 0;
}

void destroy(int d, int s) {
    int dir[4][2] = {{-1, 0}, {1, 0}, {0, -1}, {0, 1}};
    pair<int, int> p = make_pair(N/2, N/2);
    for (int i=1; i<=s; i++) {
        int row = p.first + dir[d][0] * i;
        int col = p.second + dir[d][1] * i;
        if (row < 0 || row >= N || col < 0 || col >= N) break;
        marbles[a[row][col]] = 0;
    }
    move();
}

vector<pair<int, int> > check() {
    vector<pair<int, int> > result;
    int i, marble = 0, count = 0, start;
    for (i=1; i<N*N; i++) {
        if (marbles[i] == 0) break;
        if (marbles[i] != marble) {
            if (count >= 4) result.push_back(make_pair(start, i-1));
            marble = marbles[i];
            count = 0;
            start = i;
        }
        count++;
    }
    if (count >= 4) result.push_back(make_pair(start, i-1));
    return result;
}

void explode() {
    vector<pair<int, int> > targets;
    while (true) {
        targets = check();
        if (targets.empty()) break;
        for (auto target: targets) {
            for (int i=target.first; i<=target.second; i++) {
                exploded[marbles[i]-1]++;
                marbles[i] = 0;
            }
        }
        move();
    }
}

void change() {
    vector<pair<int, int> > v;
    int i, marble = 0, count = 0;
    for (i=1; i<N*N; i++) {
        if (marbles[i] != marble) {
            if (marble > 0) {
                v.push_back(make_pair(count, marble));
                if (v.size() * 2 == N*N - 1) break;
            }
            if (marbles[i] == 0) break;
            marble = marbles[i];
            count = 0;
        }
        count++;
    }
    int k = 0;
    for (i=1; k<v.size(); i+=2) {
        marbles[i] = v[k].first;
        marbles[i+1] = v[k].second;
        k++;
    }
    while (i < N*N) {
        marbles[i] = 0;
        i++;
    }
}

int main(void) {
    scanf("%d %d", &N, &M);
    makeNumber();
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            int num;
            scanf("%d", &num);
            marbles[a[i][j]] = num;
        }
    }
    for (int i=0; i<M; i++) {
        int d, s;
        scanf("%d %d", &d, &s);
        destroy(d-1, s);
        explode();
        change();
    }
    int answer = 0;
    for (int i=0; i<3; i++) {
        answer += exploded[i] * (i + 1);
    }
    printf("%d\n", answer);
    return 0;
}