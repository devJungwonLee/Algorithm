#include <iostream>
#include <queue>
#include <map>
using namespace std;

int T, v[4000001];

void bfs(int num) {
    queue<int> q;
    for (int i=0; i<=4000000; i++) v[i] = -1;
    v[1] = 0;
    q.push(1);
    while (!q.empty()) {
        int x = q.front();
        q.pop();
        if (x == num) return;
        if (2 * x <= 4000000 && v[2*x] == -1) {
            v[2*x] = v[x] + 1;
            q.push(2*x);
        }
        if (x - 1 > 0 && v[x-1] == -1) {
            v[x-1] = v[x] + 1;
            q.push(x-1);
        }
    }
}

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> T;
    for (int i=0; i<T; i++) {
        int k;
        cin >> k;
        bfs(k);
        if (v[k] >= 0) cout << v[k] << "\n";
        else cout << "Wrong proof!\n";
    }
    return 0;
}