#include <iostream>
#include <queue>
using namespace std;

int K, m, r[10];
queue<int> q;

int main(void) {
    scanf("%d", &K);
    scanf("%d", &m);
    for (int i=0; i<m; i++) scanf("%d", &r[i]);
    for (int i=1; i<=K; i++) q.push(i);
    for (int i=0; i<m; i++) {
        int first = q.front();
        bool flag = false;
        for (int j=1; ; j++) {
            int front = q.front();
            if (flag && first == front) break;
            q.pop();
            if (j % r[i] != 0) q.push(front);
            flag = true;
        }
    }
    while (!q.empty()) {
        printf("%d\n", q.front());
        q.pop();
    }
    return 0;
}
