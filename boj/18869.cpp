#include <iostream>
#include <vector>
#include <set>
#include <map>
using namespace std;

int M, N;
map<vector<int>, int> cnt;

int main(void) {
    scanf("%d %d", &M, &N);
    for (int i=0; i<M; i++) {
        vector<int> v1;
        set<int> s;
        map<int, int> m;
        int num;
        for (int j=0; j<N; j++) {
            scanf("%d", &num);
            v1.push_back(num);
            s.insert(num);
        }
        int idx = 0;
        for (auto num: s) {
            m[num] = idx;
            idx++;
        }
        vector<int> v2;
        for (auto num: v1) {
            v2.push_back(m[num]);
        }
        cnt[v2]++;
    }
    int answer = 0;
    for (auto e: cnt) {
        int c = e.second;
        answer += c*(c-1)/2;
    }
    printf("%d\n", answer);
    return 0;
}