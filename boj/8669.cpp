#include <iostream>
#include <set>
using namespace std;

int n;
set<int> s;

int main(void) {
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        int g, r;
        scanf("%d %d", &g, &r);
        s.insert(r);
    }
    printf("%lu\n", s.size());
    return 0;
}
