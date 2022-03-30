#include <iostream>
using namespace std;

int parent[10001];
bool v[10001];

int main(void) {
    int T;
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        int n, v1, v2;
        scanf("%d", &n);
        for (int i=1; i<=n; i++) {
            parent[i] = 0;
            v[i] = false;
        }
        for (int i=0; i<n-1; i++) {
            scanf("%d %d", &v1, &v2);
            parent[v2] = v1;
        }
        scanf("%d %d", &v1, &v2);
        v[v1]=true;
        int num = v1;
        while (true) {
            v[num] = true;
            if (parent[num] == 0) break;
            num = parent[num];
        }
        num = v2;
        while (!v[num]) num = parent[num];
        printf("%d\n", num);
    }
    return 0;
}