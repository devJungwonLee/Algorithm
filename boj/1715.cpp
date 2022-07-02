#include <iostream>
#include <queue>
using namespace std;

int N, answer = 0, num;
priority_queue<int, vector<int>, greater<int> > pq;

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%d", &num);
        pq.push(num);
    }
    while (pq.size()>1) {
        int a = pq.top();
        pq.pop();
        int b = pq.top();
        pq.pop();
        answer += a+b;
        pq.push(a+b);
    }
    printf("%d\n", answer);
    return 0;
}