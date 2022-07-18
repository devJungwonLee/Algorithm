#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int n, m;
long long T, a[1001], b[1001], answer = 0;
vector<long long> va, vb;

int findLower(vector<long long> &v, long long num) {
    int left = 0, right = v.size()-1, mid;
    while (left < right) {
        mid = (left + right + 1) / 2;
        if (v[mid] >= num) right = mid - 1;
        else left = mid;
    }
    if (v[left] >= num) left--;
    return left;
}

int findUpper(vector<long long> &v, long long num) {
    int left = 0, right = v.size()-1, mid;
    while (left < right) {
        mid = (left + right) / 2;
        if (v[mid] <= num) left = mid + 1;
        else right = mid;
    }
    if (v[left] <= num) left++;
    return left;
}

void findCombination(vector<long long> &va, vector<long long> &vb) {
    vector<long long>& vlong = va.size() > vb.size() ? va : vb;
    vector<long long>& vshort = va.size() <= vb.size() ? va : vb;
    for (auto x: vshort) {
        long long num = T - x;
        int lowerBound = findLower(vlong, num);
        int upperBound = findUpper(vlong, num);
        answer += max(0, upperBound - lowerBound -1);
    }
}

int main(void) {
    scanf("%lld", &T);
    scanf("%d", &n);
    for (int i=1; i<=n; i++) scanf("%lld", &a[i]);
    scanf("%d", &m);
    for (int i=1; i<=m; i++) scanf("%lld", &b[i]);

    for (int i=1; i<=n; i++) a[i] = a[i] + a[i-1];
    for (int i=1; i<=n; i++) {
        for (int j=1; j<=n; j++) {
            if (i>=j) va.push_back(a[i]-a[i-j]);
        }
    }
    sort(va.begin(), va.end());

    for (int i=1; i<=m; i++) b[i] = b[i] + b[i-1];
    for (int i=1; i<=m; i++) {
        for (int j=1; j<=m; j++) {
            if (i>=j) vb.push_back(b[i]-b[i-j]);
        }
    }
    sort(vb.begin(), vb.end());
    findCombination(va, vb);
    printf("%lld\n", answer);
    return 0;
}