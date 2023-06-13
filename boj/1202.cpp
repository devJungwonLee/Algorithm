#include <iostream>
#include <queue>
#include <vector>
#include <algorithm>
using namespace std;

struct compare {
    bool operator()(pair<int, int> &a, pair<int, int> &b) {
        return a.second < b.second;
    }
};

int N, K;
long long sum = 0;
priority_queue<pair<int, int>, vector<pair<int, int> >, compare> pq;
vector<pair<int, int> > jewels;
vector<int> bags;

int main(void) {
    scanf("%d %d", &N, &K);
    for (int i=0; i<N; i++) {
        int m, v;
        scanf("%d %d", &m, &v);
        jewels.push_back(make_pair(m, v));
    }
    for (int i=0; i<K; i++) {
        int c;
        scanf("%d", &c);
        bags.push_back(c);
    }
    sort(jewels.begin(), jewels.end());
    sort(bags.begin(), bags.end());
    int idx = 0;
    for (auto bag: bags) {
        while (idx < jewels.size() && jewels[idx].first <= bag) {
            pq.push(jewels[idx]);
            idx++;
        }
        if (!pq.empty()) {
            int price = pq.top().second;
            sum += (long long)price;
            pq.pop();
        }
    }
    printf("%lld\n", sum);
    return 0;
}
