#include <string>
#include <vector>
using namespace std;

long long factorial(int n) {
    long long result = 1;
    for (int i=1; i<=n; i++) {
        result *= (long long)i;
    }
    return result;
}

vector<int> solution(int n, long long k) {
    vector<int> answer, v;
    for (int i=1; i<=n; i++) v.push_back(i);
    k--;
    long long m = factorial(n);
    for (int i=n; i>=1; i--) {
        m /= i;
        int q = (int)(k / m);
        int num = v[q];
        v.erase(v.begin()+q);
        answer.push_back(num);
        k = k % m;
    }
    return answer;
}