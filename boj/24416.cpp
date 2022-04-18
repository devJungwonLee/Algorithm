#include <iostream>
using namespace std;

int main(void) {
    int n;
    cin >> n;
    int x=1, y=1, z;
    for (int i=2; i<n; i++) {
        z = x+y;
        x=y;
        y=z;
    }
    cout << y << " " << n-2 << endl;
    return 0;
}