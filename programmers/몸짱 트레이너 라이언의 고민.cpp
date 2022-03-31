#include <vector>
#include <utility>
#include <algorithm>
#include <cstdlib>
using namespace std;

bool cmp(pair<int, bool> &a, pair<int, bool> &b) {
    if (a.first == b.first) {
        return a.second > b.second;
    } else return a.first < b.first;
}

int dist(int a, int b, int n) {
    int ra = a/n;
    int ca = a%n;
    int rb = b/n;
    int cb = b%n;
    return abs(ra-rb)+abs(ca-cb);
}

bool check(int d, int pnum, int n) {
    if (d==1 && pnum <= n*n) return true;
    if (d==2 && pnum <= (n*n+1)/2) return true;
    
    for (int i=0; i<n; i++) {
        vector<int> v;
        v.push_back(i);
        for (int j=i+1; j<n*n; j++) {
            bool success = true;
            for (auto num: v) {
                if (dist(num, j, n) < d) {
                    success = false;
                    break;
                }
            }
            if (success) {
                v.push_back(j);
                if (v.size()==pnum) return true;
            }
        }
    }
    return false;
}

int solution(int n, int m, vector<vector<int>> timetable) {
    vector<pair<int, bool>> time;
    for (auto t: timetable) {
        time.push_back(make_pair(t[0], true));
        time.push_back(make_pair(t[1], false));
    }
    
    sort(time.begin(), time.end(), cmp);
    int cnt = 0, maxValue = 0;
    for (auto t: time) {
        if (t.second) {
            cnt++;
            maxValue = max(maxValue, cnt);
        } else cnt--;
    }
    if (maxValue==1) return 0;
    
    int left = 1, right = 2*n-2;
    while (left < right) {
        int mid = (left+right+1)/2;
        bool success = check(mid, maxValue, n);
        if (success) left = mid;
        else right = mid-1;
    }
    return left;
}