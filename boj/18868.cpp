#include <iostream>
using namespace std;

int M, N;
int p[10][100];

bool check(int *a, int *b) {
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            if (a[i] == a[j] && b[i] != b[j]) return false;
            if (a[i] < a[j] && b[i] >= b[j]) return false;
            if (a[i] > a[j] && b[i] <= b[j]) return false;
        }
    }
    return true;
}

int main(void) {
    int cnt = 0;
    scanf("%d %d", &M, &N);
    for (int i=0; i<M; i++) {
        for (int j=0; j<N; j++) scanf("%d", &p[i][j]);
    }
    for (int i=0; i<M; i++) {
        for (int j=i+1; j<M; j++) {
            bool result = check(p[i], p[j]);
            if (result) cnt++;
        }
    }
    printf("%d\n", cnt);
    return 0;
}