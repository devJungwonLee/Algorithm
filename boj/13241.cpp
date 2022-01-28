#include <iostream>
#include <algorithm>
using namespace std;

int main(void) {
	long long int a, b;
	cin >> a >> b;
	long long int x = max(a, b);
	long long int y = min(a, b);
	long long int r, gcd, lcm;
	do {
		r = x % y;
		x = y;
		y = r;
	} while (r>0);
	gcd = x;
	lcm = gcd * (a/gcd) * (b/gcd);
	cout << lcm << endl;
	return 0;
}
