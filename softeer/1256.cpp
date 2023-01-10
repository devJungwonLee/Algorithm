#include <iostream>
#include <cmath>
using namespace std;

int H, K, R;
int a[11000], temp[11000];

void f(int start, int end, int depth) {
    int mid = (start + end) / 2;
    if (depth < H-1) {
        f(start, mid, depth+1);
        f(mid+1, end, depth+1);
    }
    int i = start;
    int j = mid + 1;
    int k = 0;
    bool flag = (H-depth+1)%2 == 0;
    while (i <= mid && j <= end) {
        if (flag) temp[k++] = a[j++];
        else temp[k++] = a[i++];
        flag = !flag;
    }
    if (i > mid) {
        while (j <= end) temp[k++] = a[j++];
    } else {
        while (i <= mid) temp[k++] = a[i++];
    }
    for (int i=0; i<k; i++) a[start+i] = temp[i];
}

int main(void) {
    scanf("%d %d %d", &H, &K, &R);
    int n = (int)(pow(2, H));
    for (int i=0; i<n; i++) {
        for (int j=0; j<K; j++) {
            int work;
            scanf("%d", &work);
            a[i*K + j] = work;
        }
    }
    f(0, n*K-1, 0);
    int answer = 0;
    for (int i=0; i<=(R-H-1); i++) answer += a[i];
    printf("%d\n", answer);
    return 0;
}
