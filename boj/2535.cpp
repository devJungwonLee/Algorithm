#include <iostream>
#include <map>
#include <vector>
#include <algorithm>
using namespace std;

struct Node {
	int country;
	int id;
	int point;
};

int N;
map<int, int> cnt;
vector<Node> v;

bool cmp(Node &a, Node &b) {
	return a.point > b.point;
}

int main(void) {
	cin >> N;
	for (int i=0; i<N; i++) {
		int a, b, c;
		cin >> a >> b >> c;
		v.push_back((Node){a, b, c});
	}
	sort(v.begin(), v.end(), cmp);
	int count = 0;
	for (int i=0; count<3; i++) {
		int country = v[i].country;
		if (cnt.find(country) == cnt.end() || cnt[country] < 2) {
			cout << v[i].country << " " << v[i].id << endl;
			cnt[country]++;
			count++;
		}
	}
	return 0;
}
