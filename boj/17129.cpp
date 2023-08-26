#include <iostream>
#include <vector>
#include <string>
#include <queue>
#include <utility>
using namespace std;

int n, m;
pair<int, int> start;
vector<string> a;
int v[3000][3000];
queue<pair<int, int> > q;
int dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
bool success = false;

int main(void) {
    ios::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> n >> m;
    for (int i=0; i<n; i++) {
        string s;
        cin >> s;
        for (int j=0; j<s.size(); j++) {
            if (s[j] == '2') start = make_pair(i, j);
        }
        a.push_back(s);
    }
    v[start.first][start.second] = 1;
    q.push(start);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        if (a[row][col] >= '3') {
            cout << "TAK\n";
            cout << v[row][col] - 1 << "\n";
            success = true;
            break;
        }
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr < 0 || newr >= n || newc < 0 || newc >= m) continue;
            if (a[newr][newc] == '1') continue;
            if (v[newr][newc] > 0) continue;
            v[newr][newc] = v[row][col] + 1;
            q.push(make_pair(newr, newc));
        }
    }
    if (!success) {
        cout << "NIE\n";
    }
    return 0;
}