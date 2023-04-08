#include <iostream>
#include <queue>
#include <map>
using namespace std;

queue<int> q;
map<int, int> cnt;
int target;

int bfs(int start) {
    int d[2][2] = {{0, 1}, {1, 0}};
    cnt[start] = 0;
    q.push(start);
    while (!q.empty()) {
        int time = q.front();
        q.pop();
        int h = time / 60;
        int m = time % 60;
        if (time == target) {
            return cnt[time];
        }
        for (int i=0; i<2; i++) {
            int newh = h + d[i][0];
            int newm = m + d[i][1];
            int newtime = newh * 60 + newm;
            if (newtime >= 24 * 60) newtime -= 24 * 60;
            if (cnt.find(newtime) != cnt.end()) continue;
            cnt[newtime] = cnt[time] + 1;
            q.push(newtime);
        }
    }
}

int main(void) {
    int h, m;
    scanf("%d:%d", &h, &m);
    int start = h*60 + m;
    scanf("%d:%d", &h, &m);
    target = h*60 + m;
    printf("%d\n", bfs(start));
}