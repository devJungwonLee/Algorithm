#include <iostream>
#include <algorithm>
using namespace std;

int gcd(int a, int b) {
	int x = max(a, b);
	int y = min(a, b);
	if (x%y == 0) return y;
	else return gcd(y, x%y);
}

int main(void) {
	int n, a, b, c, g;
	cin >> n;
	cin >> a >> b;
	if (n==3) {
		cin >> c;
		g = gcd(gcd(a, b), c);
	} else g = gcd(a, b);
	for (int i=1; i<=g; i++) {
		if (g%i == 0) cout << i << endl;
	}
	return 0;
}
