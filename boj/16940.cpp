#include <iostream>
#include <set>
#include <queue>
using namespace std;

int N;
set<int> adj[100001];
queue<int> q, order;

int bfs() {
    int result = 1;
    int start = order.front();
    order.pop();
    if (start != 1) return 0;
    q.push(start);
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        int size = adj[num].size()-1;
        if (num == start) size++;
        for (int i=0; i<size; i++) {
            int child = order.front();
            order.pop();
            if (adj[num].find(child) == adj[num].end()) return 0;
            q.push(child);
        }
    }
    return 1;
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N-1; i++) {
        int v1, v2;
        scanf("%d %d", &v1, &v2);
        adj[v1].insert(v2);
        adj[v2].insert(v1);
    }
    for (int i=0; i<N; i++) {
        int x;
        scanf("%d", &x);
        order.push(x);
    }
    printf("%d\n", bfs());
    return 0;
}