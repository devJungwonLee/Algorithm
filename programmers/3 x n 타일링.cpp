#include <string>
#include <vector>

using namespace std;

int d[5001];
int m = 1000000007;

int solution(int n) {
    if (n%2 == 1) return 0;
    d[0] = 1;
    d[2] = 3;
    for (int i=4; i<=n; i+=2) {
        d[i] = 4 * (long long)d[i-2] % m - d[i-4];
        if (d[i] < 0) d[i] = (d[i] + m) % m; 
    }
    return d[n];
}