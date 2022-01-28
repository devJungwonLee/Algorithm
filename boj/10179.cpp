#include <iostream>
using namespace std;

int main(void) {
	int T;
	cin >> T;
	for (int t=0; t<T; t++) {
		double price;
		cin >> price;
		printf("$%.2lf\n", price * 0.8);
	}
	return 0;
}
