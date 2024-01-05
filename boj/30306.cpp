#include <iostream>
using namespace std;

int n, a[1000], b[1000], ca = 0, cb = 0;

int main(void) {
    scanf("%d", &n);
    for (int i=0; i<n; i++) scanf("%d", &a[i]);
    for (int i=0; i<n; i++) scanf("%d", &b[i]);
    for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
            if (a[i] > b[j]) ca++;
            else if (a[i] < b[j]) cb++;
        }
    }
    if (ca > cb) printf("first\n");
    else if (ca < cb) printf("second\n");
    else printf("tie\n");
    return 0;
}
