#include <iostream>
#include <utility>
#include <queue>
using namespace std;

struct compare {
    bool operator()(pair<int, int> &a, pair<int, int> &b) {
        if (a.second == b.second) return a.first > b.first;
        return a.second > b.second;
    }
};

priority_queue<pair<int, int>, vector<pair<int, int> >, compare> pq;

int main(void) {
    int N, from, to, start = 0, answer = 0;
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%d %d", &from, &to);
        pq.push(make_pair(from, to));
    }
    while (!pq.empty()) {
        pair<int, int> time = pq.top();
        pq.pop();
        if (time.first >= start) {
            answer++;
            start = time.second;
        }
    }
    printf("%d\n", answer);
    return 0;
}