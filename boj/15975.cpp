#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;

int N, x, y;
map<int, vector<int> > v;

int main(void) {
    cin >> N;
    for (int i=0; i<N; i++) {
        cin >> x >> y;
        v[y].push_back(x);
    }
    long int sum = 0;
    for (auto it = v.begin(); it != v.end(); it++) {
        vector<int> vec = it->second;
        sort(vec.begin(), vec.end());
        if (vec.size() > 1) {
            for (int i=0; i<vec.size(); i++) {
                if (i==0) sum += vec[i+1]-vec[i];
                else if (i==vec.size()-1) sum += vec[i]-vec[i-1];
                else sum += min(vec[i+1]-vec[i], vec[i]-vec[i-1]);
            }
        }
    }
    cout << sum << endl;
    return 0;
}