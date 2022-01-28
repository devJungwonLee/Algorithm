#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int main(void) {
    int n;
    vector<int> v;
    cin >> n;
    int k = (int)((double)n*0.15 + 0.5);
    for (int i=0; i<n; i++) {
        int point;
        cin >> point;
        v.push_back(point);
    }
    sort(v.begin(), v.end());
    int sum = 0;
    for (int i=k; i<n-k; i++) sum += v[i];
    if (n == 0) cout << "0" << endl;
    else cout << (int)((double)sum/(n-2*k) + 0.5) << endl;
    return 0;
}