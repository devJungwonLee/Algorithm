#include <iostream>
#include <vector>
#include <algorithm>
#include <set>
using namespace std;

int main(void) {
    int N, M;
    vector<int> v;
    set<vector<int> > s;

    scanf("%d %d", &N, &M);
    for (int i=0; i<N; i++) {
        int num;
        scanf("%d", &num);
        v.push_back(num);
    }
    sort(v.begin(), v.end());

    do {
        vector<int> tmp;
        for (int i=0; i<M; i++) {
            tmp.push_back(v[i]);
        }
        s.insert(tmp);
    } while (next_permutation(v.begin(), v.end()));

    for (auto e: s) {
        string tmp = "";
        for (auto num: e) {
            tmp += to_string(num);
            tmp += " ";
        }
        cout << tmp << "\n";
    }
    return 0;
}