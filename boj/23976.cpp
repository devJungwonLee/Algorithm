#include <iostream>
using namespace std;

int N, K;
int d[2501][2501][2];
string s;

int dp(int i, int j, int k) {
    if (i<j) return 0;
    if (d[i][j][k]>0) return d[i][j][k];
    char c = s[i-1];
    if (c=='0') {
        if (i==1) {
            if (k==0) d[i][j][k] = 1;
            else d[i][j][k] = 0;
        } else if (j==1) {
            if (k==0) d[i][j][k] = 0;
            else if (s[0]=='0') d[i][j][k] = 0;
            else d[i][j][k] = 1;
        } else {
            if (k==0) d[i][j][k] = (dp(i-1, j-1, 0) + dp(i-1, j-1, 1)) % 1000000007;
            else d[i][j][k] = dp(i-1, j, 1);
        }
    } else {
        if (i==1) {
            if (k==0) d[i][j][k] = 0;
            else d[i][j][k] = 1;
        } else if (j==1) {
            if (k==0) d[i][j][k] = 0;
            else if (s[0]=='0') d[i][j][k] = 0;
            else d[i][j][k] = 1;
        } else {
            if (k==0) d[i][j][k] = 0;
            else d[i][j][k] = ((dp(i-1, j-1, 0) + dp(i-1, j-1, 1)) % 1000000007 + dp(i-1, j, 1)) % 1000000007;
        }
    }
    return d[i][j][k];
}

int main(void) {
    cin >> N >> K;
    cin >> s;
    int answer = (dp(N, K, 0) + dp(N, K, 1)) % 1000000007;
    cout << answer << "\n";
    return 0;
}