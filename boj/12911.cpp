#include <iostream>
using namespace std;

int n, k, d[10][100001];
int mod = 1000000007;

int main() {
	cin >> n >> k;
	for (int i=0; i<n; i++) {
		for (int j=1; j<=k; j++) {
			if (j==1) d[i][j] = 1;
			else if (i==0) d[i][j] = (d[i][j-1] + 1) % mod;
			else {
				d[i][j] = d[i-1][k];
                for (int x=2*j; x<=k; x+=j) {
                    d[i][j] = (d[i][j] - (d[i-1][x] - d[i-1][x-1])) % mod;
                }
				d[i][j] = (d[i][j] + d[i][j-1]) % mod;
			}
		}
	}
	cout << d[n-1][k] << endl;
	return 0;
}
