#include <iostream>
#include <utility>
using namespace std;

int main(void) {
    int T;
    cin >> T;
    for (int t=0; t<T; t++) {
        string a, b;
        cin >> a >> b;
        cout << "Distances: ";
        for (int i=0; i<a.size(); i++) {
            int d = b[i] - a[i];
            if (d<0) d += 26;
            cout << d << " ";
        }
        cout << "\n";
    }
    return 0;
}