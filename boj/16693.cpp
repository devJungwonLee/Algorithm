#include <iostream>
using namespace std;

int main(void) {
    int a, r, p1, p2;
    cin >> a >> p1;
    cin >> r >> p2;
    if (((double)r*r*3.1415926535)/p2 > (double)a/p1) {
        cout << "Whole pizza" << endl;
    } else {
        cout << "Slice of pizza" << endl;
    }
    return 0;
}