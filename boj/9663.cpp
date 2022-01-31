#include <iostream>
#include <vector>
using namespace std;

int N, answer = 0;
vector<int> v;

void f(int depth) {
    if (depth == N) {
        answer++;
        return;
    }
    for (int i=0; i<N; i++) {
        bool flag = true;
        for (int j=0; j<v.size(); j++) {
            int row = j;
            int col = v[j];
            if (col == i || row + col == depth + i || row - col == depth - i) {
                flag = false;
                break;
            }
        }
        if (flag) {
            v.push_back(i);
            f(depth+1);
            v.pop_back();
        }
    }
}

int main(void) {
    cin >> N;
    f(0);
    cout << answer << endl;
    return 0;
}