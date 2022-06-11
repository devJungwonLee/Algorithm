#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int N, num, answer = 0;
vector<int> v, v2;

int gcd(int a, int b) {
    if (a > b) {
        if (a % b == 0) return b;
        else return gcd(b, a%b);
    } else {
        if (b % a == 0) return a;
        else return gcd(a, b%a);
    }
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%d", &num);
        v.push_back(num);
    }
    sort(v.begin(), v.end());
    for (int i=1; i<N; i++) {
        if (v[i]-v[i-1]!=0) v2.push_back(v[i]-v[i-1]);
    }
    int g = v2[0];
    for (int i=1; i<v2.size(); i++) g = gcd(g, v2[i]);
    for (int i=0; i<v2.size(); i++) answer += (v2[i]/g -1);
    printf("%d\n", answer);
    return 0;
}