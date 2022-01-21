#include <cstdio>
#include <deque>
#include <utility>
using namespace std;

int N, L;
deque<pair<int, int> > dq;

int main(void) {
    scanf("%d %d", &N, &L);
    for (int i=0; i<N; i++) {
        int num;
        scanf("%d", &num);
        while (!dq.empty() && dq.back().first >= num) dq.pop_back();
        dq.push_back(make_pair(num, i));
        while (!dq.empty() && i - dq.front().second >= L) dq.pop_front();
        printf("%d ", dq.front().first);
    }
    printf("\n");
    return 0;
}