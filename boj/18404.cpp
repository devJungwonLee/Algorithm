#include <iostream>
#include <utility>
#include <queue>
#include <map>
using namespace std;

int n, m;
int dir[8][2] = {{-2, -1}, {-2, 1}, {-1, -2}, {-1, 2}, {1, -2}, {1, 2}, {2, -1}, {2, 1}};
pair<int, int> start;
queue<pair<int, int> > q;
map<pair<int, int>, int> dist;

int main(void) {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> n >> m;
    int r, c;
    cin >> r >> c;
    start = make_pair(r, c);

    dist[start] = 0;
    q.push(start);
    while (!q.empty()) {
        pair<int, int> current = q.front();
        q.pop();
        for (int i=0; i<8; i++) {
            int newr = current.first + dir[i][0];
            int newc = current.second + dir[i][1];
            if (newr < 1 | newr > n || newc < 1 || newc > n) continue;
            pair<int, int> next = make_pair(newr, newc);
            if (dist.find(next) != dist.end()) continue;
            dist[next] = dist[current] + 1;
            q.push(next);
        }
    }

    for (int i=0; i<m; i++) {
        cin >> r >> c;
        cout << dist[make_pair(r, c)] << " ";
    }
    cout << "\n";
    return 0;
}