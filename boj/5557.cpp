#include <iostream>
using namespace std;

int n, num[101];
long long int d[101][21];

int main(void) {
    cin >> n;
    for (int i=1; i<=n; i++) cin >> num[i];
    d[1][num[1]] = 1;
    for (int i=1; i<n-1; i++) {
        for (int j=0; j<=20; j++) {
            if (d[i][j]==0) continue;
            int k = j + num[i+1];
            if (k<=20) d[i+1][k] += d[i][j];
            k = j - num[i+1];
            if (k>=0) d[i+1][k] += d[i][j];
        }
    }
    cout << d[n-1][num[n]] << endl;
    return 0;
}