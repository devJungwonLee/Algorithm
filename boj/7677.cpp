#include <iostream>
#include <map>
#include <vector>
using namespace std;

typedef vector<vector<int>> Matrix;
int N;
map<int, Matrix> d;

Matrix multiply(Matrix a, Matrix b) {
    Matrix result;
    for (int i=0; i<2; i++) {
        vector<int> tmp;
        for (int j=0; j<2; j++) {
            int sum = 0;
            for (int k=0; k<2; k++) {
                sum = (sum + (a[i][k] * b[k][j]) % 10000) % 10000;
            }
            tmp.push_back(sum);
        }
        result.push_back(tmp);
    }
    return result;
}

Matrix f(int n) {
    if (d.find(n) != d.end()) return d[n];
    if (n%2==0) d[n] = multiply(f(n/2), f(n/2));
    else d[n] = multiply(f(1), f(n-1));
    return d[n];
}

int main(void) {
    Matrix base = {{1,1}, {1,0}};
    d[1] = base;
    while (true) {
        scanf("%d", &N);
        if (N==-1) return 0;
        else if (N==0) printf("0\n");
        else {
            Matrix result = f(N);
            printf("%d\n", result[0][1]);
        }
    }
}