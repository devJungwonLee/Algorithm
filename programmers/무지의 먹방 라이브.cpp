#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int solution(vector<int> food_times, long long k) {
    long long left=1, right=100000000, mid, sum;
    vector<int> food_nums;
    while (left<right) {
        mid = (left+right)/2;
        sum = 0;
        for (int i=0; i<food_times.size(); i++) {
            sum += min((long long)food_times[i], mid);
            if (sum>=k) break;
        }
        if (sum>=k) right = mid;
        else left = mid+1;
    }
    sum = 0;
    for (int i=0; i<food_times.size(); i++) {
        if (food_times[i] >= left) {
            sum += left-1;
            food_nums.push_back(i);
        }
        else sum += food_times[i];
    }
    long long remain = k - sum;
    if (remain < food_nums.size()) return food_nums[remain]+1;
    else {
        for (int i=0; i<food_times.size(); i++) {
            if ((long long)food_times[i] > left) return i+1;
        }
    }
    return -1;
}