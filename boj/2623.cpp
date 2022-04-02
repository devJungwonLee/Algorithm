#include <iostream>
#include <vector>
#include <queue>
using namespace std;

int N, M, pointed[1001];
vector<int> adj[1001], answer;
queue<int> q;

int main(void) {
    scanf("%d %d", &N, &M);
    for (int i=0; i<M; i++) {
        int k, p1, p2;
        scanf("%d", &k);
        for (int j=0; j<k; j++) {
            if (j>0) p1 = p2;
            scanf("%d", &p2);
            if (j>0) {
                adj[p1].push_back(p2);
                pointed[p2]++;
            }
        }
    }
    for (int i=1; i<=N; i++) {
        if (pointed[i]==0) q.push(i);
    }
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        answer.push_back(num);
        for (auto other: adj[num]) {
            pointed[other]--;
            if (pointed[other]==0) q.push(other);
        }
    }
    if (answer.size()!=N) printf("0\n");
    else {
        for (auto num: answer) printf("%d\n", num);
    }
    return 0;
}