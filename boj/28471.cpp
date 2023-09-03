#include <iostream>
#include <string>
#include <vector>
#include <queue>
using namespace std;

int n, answer = -1;
vector<string> a;
pair<int, int> start;
queue<pair<int, int> > q;
bool v[2000][2000];
int dir[7][2] = {{-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, -1}, {0, -1}};

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> n;
    for (int i=0; i<n; i++) {
        string s;
        cin >> s;
        for (int j=0; j<s.size(); j++) {
            if (s[j] == 'F') start = make_pair(i, j);
        }
        a.push_back(s);
    }
    v[start.first][start.second] = true;
    q.push(start);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        answer++;
        for (auto d: dir) {
            int newr = row + d[0];
            int newc = col + d[1];
            if (newr < 0 || newr >=n || newc < 0 || newc >= n) continue;
            if (a[newr][newc] == '#' || v[newr][newc]) continue;
            v[newr][newc] = true;
            q.push(make_pair(newr, newc));
        }
    }
    cout << answer << "\n";
    return 0;
}