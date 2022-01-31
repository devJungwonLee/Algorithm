#include <iostream>
#include <vector>
using namespace std;

typedef vector<vector<long long> > Matrix;
Matrix base = {{1, 1}, {1, 0}};


Matrix multiply(Matrix a, Matrix b) {
    Matrix result = {{0, 0}, {0, 0}};
    for (int i=0; i<2; i++) {
        for (int j=0; j<2; j++) {
            for (int k=0; k<2; k++) {
                long long product = a[i][k] * b[k][j] % 1000000007;
                result[i][j] = (result[i][j] + product) % 1000000007;
            }
        }
    }
    return result;
}

Matrix f(long long n) {
    if (n==1) return base;
    if (n%2 == 0) {
        Matrix half = f(n/2);
        return multiply(half, half); 
    } else {
        return multiply(base, f(n-1));
    }
}

int main(void) {
    long long N;
    cin >> N;
    Matrix matrix = f(N);
    cout << matrix[1][0] << endl;
    return 0;
}