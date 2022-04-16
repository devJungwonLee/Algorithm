#include <iostream>
#include <vector>
using namespace std;

int h[26] = {3,2,1,2,3,3,2,3,3,2,2,1,2,2,1,2,2,2,1,2,1,1,1,2,2,1};
vector<int> v;
int main(void) {
    string a, b;
    cin >> a >> b;
    for (int i=0; i<a.size(); i++) {
        v.push_back(h[a[i]-'A']);
        v.push_back(h[b[i]-'A']);
    }
    for (int size = v.size(); size>2; size--) {
        for (int i=0; i<size-1; i++) {
            v[i] = (v[i]+v[i+1])%10;
        }
    }
    printf("%02d\n", v[0]*10+v[1]);
    return 0;
}