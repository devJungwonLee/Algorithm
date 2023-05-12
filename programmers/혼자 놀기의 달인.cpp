#include <string>
#include <vector>
#include <set>
#include <algorithm>
using namespace std;

vector<int> group;
bool v[101];

int solution(vector<int> cards) {
    for (auto card: cards) {
        if (v[card]) continue;
        set<int> s;
        int idx = card;
        while (s.find(idx) == s.end()) {
            s.insert(idx);
            v[idx] = true;
            idx = cards[idx-1];
        }
        group.push_back(s.size());
    }
    sort(group.begin(), group.end());
    int n = group.size();
    return group[n-1] * group[n-2];
}