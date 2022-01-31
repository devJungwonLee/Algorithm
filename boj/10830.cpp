#include <iostream>
#include <vector>
#include <map>
using namespace std;

typedef vector<vector<int> > Matrix;
int N;
long long B;
Matrix A;
map<long long, Matrix> cache;

Matrix multiply(Matrix a, Matrix b) {
    Matrix result;
    for (int i=0; i<N; i++) {
        vector<int> tmp;
        for (int j=0; j<N; j++) {
            int sum = 0;
            for (int k=0; k<N; k++) {
                int product = a[i][k] * b[k][j] % 1000;
                sum = (sum + product) % 1000;
            }
            tmp.push_back(sum);
        }
        result.push_back(tmp);
    }
    return result;
}

Matrix pow(long long n) {
    if (cache.find(n) != cache.end()) return cache[n];
    if (n%2 ==0) {
        Matrix half = pow(n/2);
        cache[n] = multiply(half, half);
        return cache[n];
    } else {
        cache[n] = multiply(A, pow(n-1));
        return cache[n];
    }
}

int main(void) {
    scanf("%d %lld", &N, &B);
    for (int i=0; i<N; i++) {
        vector<int> tmp;
        for (int j=0; j<N; j++) {
            int num;
            scanf("%d", &num);
            tmp.push_back(num%1000);
        }
        A.push_back(tmp);
    }
    cache[1] = A;
    Matrix matrix = pow(B);
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) printf("%d ", matrix[i][j]);
        printf("\n");
    }
    return 0;
}