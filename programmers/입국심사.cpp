#include <string>
#include <vector>
using namespace std;

long long solution(int n, vector<int> times) {
    long long answer = 0;
    long long right = 0, left = 0;
    for (int i=0; i<times.size(); i++) {
        if (times[i] > right) right = times[i];
    }
    right = right * n;
    while (left <= right) {
        long long mid = (left + right) / 2;
        long long people = 0;
        for (int i=0; i<times.size(); i++) {
            people += mid / (long long)times[i];
        }
        if (people>=n) right = mid-1;
        else if (people<n) left = mid+1;
    }
    answer = left;
    return answer;
}