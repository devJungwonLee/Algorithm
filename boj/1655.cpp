#include <iostream>
#include <queue>
using namespace std;

int main(void) {
    priority_queue<int> pq1;
    priority_queue<int, vector<int>, greater<int> > pq2;
    int N, num;
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%d", &num);
        if (i==0) pq1.push(num);
        else {
            int median = pq1.top();
            if (num>=median) {
                pq2.push(num);
                while (pq1.size() != pq2.size() && pq1.size() != pq2.size() + 1) {
                    pq1.push(pq2.top());
                    pq2.pop();
                }
            }
            else {
                pq1.push(num);
                while (pq1.size() != pq2.size() && pq1.size() != pq2.size() + 1) {
                    pq2.push(pq1.top());
                    pq1.pop();
                }
            }
        }
        printf("%d\n", pq1.top());
    }
    return 0;
}
