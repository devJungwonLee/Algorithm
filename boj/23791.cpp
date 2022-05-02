#include <iostream>
#include <algorithm>
using namespace std;

int N, Q, a[100000], b[100000];

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) scanf("%d", &a[i]);
    for (int i=0; i<N; i++) scanf("%d", &b[i]);
    scanf("%d", &Q);
    for (int q=0; q<Q; q++) {
        int i, j, k;
        scanf("%d %d %d", &i, &j, &k);
        int left = 1, right = i, mid;
        bool didFind = false;
        while (left<=right) {
            mid = (left+right)/2;
            if (k-mid<0) {
                right = mid - 1;
                continue;
            } else if (k-mid>j) {
                left = mid + 1;
                continue;
            } else {
                int num = a[mid-1];
                if (k-mid>0 && b[k-mid-1]>num) {
                    left = mid + 1;
                    continue;
                }
                if (k-mid<j && b[k-mid]<num) {
                    right = mid - 1;
                    continue;
                }
                printf("1 %d\n", mid);
                didFind = true;
                break;
            }
        }
        if (didFind) continue;
        left = 1;
        right = j;
        while (left<=right) {
            mid = (left+right)/2;
            if (k-mid<0) {
                right = mid - 1;
                continue;
            } else if (k-mid>i) {
                left = mid + 1;
                continue;
            } else {
                int num = b[mid-1];
                if (k-mid>0 && a[k-mid-1]>num) {
                    left = mid + 1;
                    continue;
                }
                if (k-mid<i && a[k-mid]<num) {
                    right = mid - 1;
                    continue;
                }
                printf("2 %d\n", mid);
                break;
            }
        }
    }
    return 0;
}