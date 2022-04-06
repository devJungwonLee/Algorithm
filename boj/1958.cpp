#include <iostream>
#include <algorithm>
using namespace std;

int d[101][101][101];

int main(void) {
    string a, b, c, tmp;
    cin >> a >> b >> c;
    a = " " + a;
    b = " " + b;
    c = " " + c;
    for (int i=1; i<a.size(); i++) {
        for (int j=1; j<b.size(); j++) {
            for (int k=1; k<c.size(); k++) {
                if (a[i]==b[j]&& b[j]==c[k]) d[i][j][k] = d[i-1][j-1][k-1]+1;
                else {
                    int tmp1 = max(max(d[i][j][k-1], d[i][j-1][k]), d[i][j-1][k-1]);
                    int tmp2 = max(max(d[i-1][j][k], d[i-1][j-1][k]), d[i-1][j][k-1]);
                    d[i][j][k] = max(tmp1, tmp2);
                }
            }
        }
    }
    printf("%d\n", d[a.size()-1][b.size()-1][c.size()-1]);
    return 0;
}