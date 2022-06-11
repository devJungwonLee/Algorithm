#include <iostream>
#include <map>
using namespace std;

int N, M, num;
map<int, int> cnt;

int main(void) {
    ios_base :: sync_with_stdio(false);
	cin.tie(NULL);
	cout.tie(NULL);
    cin >> N;
    for (int i=0; i<N; i++) {
        cin >> num;
        cnt[num]++;
    }
    cin >> M;
    for (int i=0; i<M; i++) {
        cin >> num;
        cout << cnt[num] << " ";
    }
    cout << "\n";
    return 0;
}