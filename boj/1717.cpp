#include <iostream>
using namespace std;

int n, m, root[1000001], r[1000001];

int find(int x) {
	if (root[x] == x) return x;
	root[x] = find(root[x]);
	return root[x];
}

void myUnion(int x, int y) {
	x = find(x);
	y = find(y);

	if (x == y) return;
	if (r[x] < r[y]) root[x] = y;
	else root[y] = x;

	if (r[x] == r[y]) r[x]++;
}

int main(void) {
	scanf("%d %d", &n, &m);
	for (int i=0; i<=n; i++) {
		root[i] = i;
		r[i] = 0;
	}
	for (int i=0; i<m; i++) {
		int x, a, b;
		scanf("%d %d %d", &x, &a, &b);
		if (x==1) {
			find(a) == find(b) ? printf("YES\n") : printf("NO\n");
		} else {
			myUnion(a, b);
		}
	}
	return 0;
}
