#include <string>
#include <vector>
#include <map>
#include <queue>
using namespace std;

map<int, int> v;
queue<int> q;

int bfs(int storey) {
    v[storey] = 0;
    q.push(storey);
    while (!q.empty()) {
        int current = q.front();
        q.pop();
        if (current == 0) continue;
        int x = 10;
        int temp = current;
        while (temp % 10 == 0) {
            temp /= 10;
            x *= 10;
        }
        int r = temp % 10;
        int next = (temp / 10) * x;
        if (v.find(next) == v.end() || v[current] + r < v[next]) {
            v[next] = v[current] + r;
            q.push(next);
        }
        if (temp <= 5) continue;
        next = (temp / 10 + 1) * x;
        if (v.find(next) == v.end() || v[current] + (10 - r) < v[next]) {
            v[next] = v[current] + (10 - r);
            q.push(next);
        }
    }
    return v[0];
}

int solution(int storey) {
    return bfs(storey);
}