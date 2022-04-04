#include <iostream>
#include <utility>
#include <algorithm>
using namespace std;

int N, dp[500][500];
pair<int, int> matrices[500];

int recursive(int start, int end) {
    if (start==end) return 0;
    if (dp[start][end]!=0) return dp[start][end];
    if (start+1==end) return matrices[start].first * matrices[start].second * matrices[end].second;
    for (int mid=start; mid<end; mid++) {
        int tmp = 0;
        tmp += recursive(start, mid);
        tmp += recursive(mid+1, end);
        tmp += matrices[start].first * matrices[mid].second * matrices[end].second;
        if (dp[start][end]==0) dp[start][end] = tmp;
        else dp[start][end] = min(dp[start][end], tmp);
    }
    return dp[start][end];
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        int r, c;
        scanf("%d %d", &r, &c);
        matrices[i] = make_pair(r, c);
    }
    printf("%d\n", recursive(0, N-1));
    return 0;
}