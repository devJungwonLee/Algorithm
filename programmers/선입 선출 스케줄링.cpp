#include <string>
#include <vector>

using namespace std;

int solution(int n, vector<int> cores) {
    int left = 1, right = 500000000, mid, sum;
    vector<int> v;
    while (left <= right) {
        mid = (left+right)/2;
        sum = 0;
        for (int i=0; i<cores.size(); i++) {
            sum += mid/cores[i]+1;
            if (sum>=n) break;
        }
        if (sum>=n) right = mid-1;
        else left = mid+1;
    }
    sum = 0;
    for (int i=0; i<cores.size(); i++) {
        sum += left/cores[i]+1;
        if (left%cores[i]==0) {
            sum--;
            v.push_back(i);
        }
    }
    return v[n-sum-1]+1;
}