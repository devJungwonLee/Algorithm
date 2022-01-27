#include <iostream>
#include <utility>
#include <stack>
#include <algorithm>
using namespace std;

struct Node {
    int sum;
    pair<int, int> prev;
};

int N, W;
pair<int, int> p[1001];
Node d[1001][1001];
stack<int> s;

int dist(int from, int to, bool isRow) {
    pair<int, int> f;
    if (from == 0) {
        if (isRow) f = make_pair(1, 1);
        else f = make_pair(N, N);
    } else f = p[from];
    pair<int, int> t = p[to];
    return abs(f.first - t.first) + abs(f.second - t.second);
}

int main(void) {
    cin >> N >> W;
    for (int i=1; i<=W; i++) {
        int r, c;
        cin >> r >> c;
        p[i] = make_pair(r, c);
    }
    for (int i=0; i<=W; i++) {
        for (int j=0; j<=W; j++) d[i][j].sum = 100000000;
    }
    d[0][0].sum = 0;
    for (int i=0; i<W; i++) {
        for (int j=0; j<W; j++) {
            if (i!=0 && i==j) continue;
            int n = max(i, j) + 1;
            int tmp = d[i][j].sum + dist(i, n, true);
            if (tmp < d[n][j].sum) {
                d[n][j].sum = tmp;
                d[n][j].prev = make_pair(i, j);
            }
            tmp = d[i][j].sum + dist(j, n, false);
            if (tmp < d[i][n].sum) {
                d[i][n].sum = tmp;
                d[i][n].prev = make_pair(i, j);
            }
        }
    }
    Node answer;
    answer.sum = 100000000;
    pair<int, int> last;
    for (int i=0; i<W; i++) {
        if (d[i][W].sum < answer.sum) {
            answer.sum = d[i][W].sum;
            answer.prev = d[i][W].prev;
            last = make_pair(i, W);
        }
    }
    for (int j=0; j<W; j++) {
        if (d[W][j].sum < answer.sum) {
            answer.sum = d[W][j].sum;
            answer.prev = d[W][j].prev;
            last = make_pair(W, j);
        }
    }
    cout << answer.sum << endl;
    pair<int, int> point = last;
    while (point != make_pair(0, 0)) {
        pair<int, int> prev = d[point.first][point.second].prev;
        if (point.first == prev.first) s.push(2);
        else s.push(1);
        point = prev;
    }
    while (!s.empty()) {
        cout << s.top() << endl;
        s.pop();
    }
    return 0;
}