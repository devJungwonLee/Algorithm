#include <iostream>
#include <queue>
using namespace std;

int N, dasom, answer = 0;
priority_queue<int> pq;

int main(void) {
    scanf("%d", &N);
    for(int i=0; i<N; i++) {
        int x;
        scanf("%d", &x);
        if (i==0) dasom = x;
        else pq.push(x);
    }
    while (!pq.empty()) {
        int x = pq.top();
        if (x < dasom) break;
        dasom++;
        answer++;
        pq.pop();
        pq.push(x-1);
    }
    printf("%d\n", answer);
    return 0;
}