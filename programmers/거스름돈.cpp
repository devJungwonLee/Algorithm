#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int d[100][100001];

int solution(int n, vector<int> money) {
    sort(money.begin(), money.end());
    for (int i=0; i<money.size(); i++) {
        for (int j=1; j<=n; j++) {
            int m = money[i];
            int x;
            if (m>j) x = 0;
            else if (m==j) x = 1;
            else x = d[i][j-m];
            if (i>0) x = (x + d[i-1][j]) % 1000000007;
            d[i][j] = x;
        }
    }
    return d[money.size()-1][n];
}