#include <iostream>
#include <queue>
using namespace std;

int main(void) {
    int N;
    queue<int> q;
    cin >> N;
    for (int i=1; i<=N; i++) q.push(i);
    long long t = 1;
    while (q.size()>1) {
        int r = (int)((t * t * t) % q.size());
        r = (r - 1 + q.size()) % q.size();
        for (int i=0; i<r; i++) {
            int front = q.front();
            q.pop();
            q.push(front);
        }
        q.pop();
        t++;
    }
    printf("%d\n", q.front());
    return 0;
}