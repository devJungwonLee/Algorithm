#include <iostream>
using namespace std;

int main(void) {
	unsigned long long n, left = 0, right, maxValue;
	scanf("%llu", &n);
	right = n;
	maxValue = (unsigned long long)1 << 32;
	while (left < right) {
		unsigned long long mid = (left + right) / 2;
		if (mid >= maxValue) right = mid;
		else if (mid*mid >= n) right = mid;
		else left = mid + 1;
	}
	printf("%llu\n", left);
	return 0;
}