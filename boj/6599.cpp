#include <iostream>
#include <algorithm>
#include <queue>
#include <set>
#include <map>
#include <vector>
using namespace std;

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    for (int t = 1; ; t++) {
        int n;
        cin >> n;
        if (n == 0) break;
        set<vector<int> > s;
        int x, y, z, answer = 0;
        for (int i=0; i<n; i++) {
            cin >> x >> y >> z;
            s.insert({x, y, z});
            s.insert({x, z, y});
            s.insert({y, x, z});
            s.insert({y, z, x});
            s.insert({z, x, y});
            s.insert({z, y, x});
        }
        queue<pair<int, int> > q;
        map<pair<int, int>, int> height;
        for (auto block: s) {
            pair<int, int> p = make_pair(block[0], block[1]);
            height[p] = max(height[p], block[2]);
            q.push(p);
        }
        while (!q.empty()) {
            pair<int, int> p = q.front();
            q.pop();
            answer = max(answer, height[p]);
            for (auto block: s) {
                if (block[0] >= p.first || block[1] >= p.second) continue;
                pair<int, int> newp = make_pair(block[0], block[1]);
                if (height[p] + block[2] <= height[newp]) continue;
                height[newp] = height[p] + block[2];
                q.push(newp);
            }
        }
        cout << "Case " << t << ": maximum height = " << answer << "\n";
    }
    return 0;
}