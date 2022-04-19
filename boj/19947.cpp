#include <iostream>
#include <algorithm>
using namespace std;

int d[11];

int main(void) {
    int h;
    int y;
    cin >> h >> y;
    d[0] = h;
    for (int i=1; i<=y; i++) {
        double a = i >= 1 ? d[i-1] * 1.05 : 0;
        double b = i >= 3 ? d[i-3] * 1.2 : 0;
        double c = i >= 5 ? d[i-5] * 1.35 : 0;
        d[i] = (int)(max(a, max(b, c)));
    }
    cout << d[y] << endl;
    return 0;
}