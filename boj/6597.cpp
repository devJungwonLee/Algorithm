#include <iostream>
using namespace std;

string pre, in;

void postOrder(int a, int b, int c, int d) {
	if (a>b || c>d) return;
	char parent = pre[a];
	if (a==b && c==d) {
		cout << parent;
		return;
	}
	int e = c;
	while (in[e]!=parent) e++;
	int newa, newb, newc, newd;
	newa = a+1;
	newb = a+e-c;
	newc = c;
	newd = e-1;
	postOrder(newa, newb, newc, newd);
	newa = newb+1;
	newb = b;
	newc = e+1;
	newd = d;
	postOrder(newa, newb, newc, newd);
	cout << parent;
}

int main(void) {
	while (true) {
		cin >> pre >> in;
		if (cin.eof()) break;
		postOrder(0, pre.size()-1, 0, in.size()-1);
		cout << "\n";
	}
	return 0;
}
