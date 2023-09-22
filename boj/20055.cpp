#include <iostream>
#include <deque>
using namespace std;

int N, K, a[200], t, cnt = 0, up, down;
bool robot[200];
deque<int> robotBlock;

int main(void) {
    scanf("%d %d", &N, &K);
    for (int i=0; i<2*N; i++) {
        scanf("%d", &a[i]);
    }
    up = 0;
    down = N-1;
    for (t=1; ; t++) {
        up = (up + 2*N - 1) % (2*N);
        down = (down + 2*N - 1) % (2*N);
        if (robot[down]) {
            robot[down] = false;
            robotBlock.pop_front();
        }
        bool shouldPop = false;
        for (int i=0; i<robotBlock.size(); i++) {
            int dest = (robotBlock[i] + 1) % (2*N);
            if (robot[dest]) continue;
            if (a[dest] < 1) continue;
            robot[robotBlock[i]] = false;
            robot[dest] = true;
            robotBlock[i] = dest;
            a[dest]--;
            if (a[dest] == 0) cnt++;
            if (dest == down) shouldPop = true;
        }
        if (shouldPop) {
            robot[down] = false;
            robotBlock.pop_front();
        }
        if (a[up] > 0) {
            robotBlock.push_back(up);
            robot[up] = true;
            a[up]--;
            if (a[up] == 0) cnt++;
        }
        if (cnt >= K) break;
    }
    printf("%d\n", t);
    return 0;
}