#include <iostream>
using namespace std;

int N, K, cnt = 0, answer = -1;
int a[500000], temp[500000];

void mergeSort(int left, int right) {
    if (left >= right) return;
    int mid = (left + right) / 2;
    mergeSort(left, mid);
    mergeSort(mid + 1, right);
    int i = left, j = mid + 1, k = 0;
    while (i <= mid && j <= right) {
        if (a[i] < a[j]) temp[k++] = a[i++];
        else temp[k++] = a[j++];
    }
    if (i > mid) {
        while (j <= right) temp[k++] = a[j++];
    } else {
        while (i <= mid) temp[k++] = a[i++];
    }
    for (int i=0; i<k; i++) {
        a[left + i] = temp[i];
        cnt++;
        if (cnt == K) answer = temp[i];
    }
}

int main(void) {
    scanf("%d %d", &N, &K);
    for (int i=0; i<N; i++) scanf("%d", &a[i]);
    mergeSort(0, N-1);
    printf("%d\n", answer);
    return 0;
}
