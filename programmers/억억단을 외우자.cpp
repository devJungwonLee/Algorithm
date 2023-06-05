#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int a[5000001], d[5000001];

vector<int> solution(int e, vector<int> starts) {
    vector<int> answer;
    int start;
    
    for (int i=1; i<=e; i++) {
        for (int j=1; j<=e/i; j++) d[i*j]++;
    }
    
    start = *min_element(starts.begin(), starts.end());
    for (int i=e; i>=start; i--) {
        if (i==e) a[i] = e;
        else {
            int j = a[i+1];
            if (d[i]>=d[j]) a[i] = i;
            else a[i] = j;
        }
    }
    
    for (auto x: starts) answer.push_back(a[x]);
    return answer;
}