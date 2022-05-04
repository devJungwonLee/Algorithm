#include <iostream>
#include <vector>
#include <map>
using namespace std;

typedef vector<vector<int> > Matrix; 
int T, n;
map<int, Matrix> m;

Matrix multiply(Matrix a, Matrix b) {
    Matrix result(2, vector<int>(2, 0));
    result[0][0] = (a[0][0] * b[0][0] + a[0][1] * b[1][0]) % 1000;
    result[0][1] = (a[0][0] * b[0][1] + a[0][1] * b[1][1]) % 1000;
    result[1][0] = (a[1][0] * b[0][0] + a[1][1] * b[1][0]) % 1000;
    result[1][1] = (a[1][0] * b[0][1] + a[1][1] * b[1][1]) % 1000;
    return result;
}

Matrix pow(int n) {
    if (n==1) {
        Matrix result(2, vector<int>(2, 0));
        result[0][0] = 6;
        result[0][1] = 996;
        result[1][0] = 1;
        result[1][1] = 0;
        return result;
    }
    if (m.find(n) != m.end()) return m[n];
    if (n%2==0) {
        Matrix half = pow(n/2);
        Matrix result = multiply(half, half);
        m[n] = result;
        return result;
    } else {
        Matrix prev = pow(n-1);
        Matrix one = pow(1);
        Matrix result = multiply(prev, one);
        m[n] = result;
        return result;
    }
}

int main(void) {
    scanf("%d", &T);
    for (int t=1; t<=T; t++) {
        scanf("%d", &n);
        printf("Case #%d: ", t);
        if (n==1) printf("005\n");
        else if (n==2) printf("027\n");
        else {
            Matrix r = pow(n-2);
            int answer = (r[0][0] * 28 + r[0][1] * 6) % 1000 - 1;
            printf("%03d\n", answer);
        }
    }
    return 0;
}