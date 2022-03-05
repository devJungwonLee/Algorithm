#include <string>
#include <vector>
#include <algorithm>

using namespace std;

long long solution(int a, int b, vector<int> g, vector<int> s, vector<int> w, vector<int> t) {
    long long maxValue = (long long)1 << 62;
    long long left = 0, right = maxValue, mid;
    while (left < right) {
        mid = (left + right) / 2;
        long long gMax = 0, sMax = 0, sMin = 0;
        for (int i=0; i<t.size(); i++) {
            long long total = (mid + t[i]) / (2 * t[i]) * w[i];
            if (total < 0) total = maxValue;
            gMax += min((long long)g[i], total);
            sMax += min((long long)s[i], total);
            total -= min((long long)g[i], total);
            if (total>0) sMin += min((long long)s[i], total);
        }
        if (a<= gMax && b <= sMax && a+b <= gMax+sMin) right = mid;
        else left = mid + 1;
    }
    return right;
}