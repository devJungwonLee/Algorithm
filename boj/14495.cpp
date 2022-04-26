#include <iostream>
using namespace std;

int main(void) {
    int n, d[120];
    cin >> n;
    d[1]=1;
    d[2]=1;
    d[3]=1;
    for (int i=4; i<=n; i++) d[i] = d[i-1] + d[i-3];
    cout << d[n] << endl;
    return 0;
}