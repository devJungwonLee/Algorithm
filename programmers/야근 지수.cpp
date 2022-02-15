#include <string>
#include <vector>
#include <queue>
using namespace std;

priority_queue<int> pq;

long long solution(int n, vector<int> works) {
    long long answer = 0;
    for (int i=0; i<works.size(); i++) pq.push(works[i]);
    for (int i=0; i<n; i++) {
        if (pq.empty()) break;
        int work = pq.top();
        pq.pop();
        if (work>1) pq.push(work-1);
    }
    while (!pq.empty()) {
        long long work = (long long)pq.top();
        answer += work * work;
        pq.pop();
    }
    return answer;
}