#include <iostream>
#include <set>
using namespace std;

int N, M, tn, pn, root = 0, parent[51], truth[50], party[50], p[50];

int find(int x) {
    if (parent[x] == 0) return x;
    parent[x] = find(parent[x]);
    return parent[x];
}

void uni(int x, int y) {
    int r1 = find(x);
    int r2 = find(y);
    if (r1 == r2) return;
    if (r1 == root) {
        if (r2 != root) parent[r2] = r1;
    } else {
        if (r2 == root) parent[r1] = r2;
        else parent[r2] = r1;
    }
}

int main(void) {
    scanf("%d %d", &N, &M);
    scanf("%d", &tn);
    for (int i=0; i<tn; i++) {
        scanf("%d", &truth[i]);
        if (i==0) root = truth[i];
        else uni(truth[i-1], truth[i]);
    }
    for (int i=0; i<M; i++) {
        scanf("%d", &pn);
        for (int j=0; j<pn; j++) scanf("%d", &party[j]);
        p[i] = party[0];
        for (int j=1; j<pn; j++) uni(party[j-1], party[j]);
    }
    int cnt = 0;
    for (int i=0; i<M; i++) {
        if (find(p[i]) != root) cnt++;
    }
    printf("%d\n", cnt);
    return 0;
}
