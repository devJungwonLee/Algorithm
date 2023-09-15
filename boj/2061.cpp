#include <iostream>
#include <string>
using namespace std;

string K;
int L, divisor = 0;

bool isDivisor(int n) {
    int a = 0, i = 0;
    while (i < K.size()) {
        while (a < n && i < K.size()) {
            a = a * 10 + (K[i] - '0');
            i += 1;
        }
        a = a % n;
    }
    return a == 0;
}

int main(void) {
    ios_base::sync_with_stdio(false);
    cin.tie(NULL);
    cout.tie(NULL);
    cin >> K >> L;
    for (int i=2; i<L; i++) {
        if (isDivisor(i)) {
            divisor = i;
            break;
        }
    }
    if (divisor == 0) {
        cout << "GOOD\n";
    } else {
        cout << "BAD " << divisor << "\n";
    }
    return 0;
}