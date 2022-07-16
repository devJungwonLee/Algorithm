#include <iostream>
#include <queue>
#include <algorithm>
using namespace std;

typedef pair<int, bool> Time;

struct compare{
    bool operator()(Time a, Time b){
        if (a.first == b.first) return a.second > b.second;
        return a.first > b.first;
    }
};

int N;
priority_queue<Time, vector<Time>, compare> pq;

int main(void) {
    int from, to, cnt = 0, answer = 1;
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%d %d", &from, &to);
        pq.push(make_pair(from, true));
        pq.push(make_pair(to, false));
    } 

    while (!pq.empty()) {
        Time time = pq.top();
        pq.pop();
        if (time.second) cnt++;
        else cnt--;
        while (!pq.empty() && pq.top().first == time.first) {
            if (pq.top().second) cnt++;
            else cnt--;
            pq.pop();
        }
        answer = max(answer, cnt);
    }
    printf("%d\n", answer);
    return 0;
}