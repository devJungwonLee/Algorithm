#include <string>
#include <vector>
#include <algorithm>
using namespace std;

int solution(vector<int> cookie) {
    int sum[2000], n = cookie.size(), answer = 0;
    for (int i=0; i<n; i++) {
        if (i==0) sum[i] = cookie[i];
        else sum[i] = sum[i-1] + cookie[i];
    }
    for (int i=0; i<n; i++) {
        for (int j=i+1; j<n; j++) {
            int total, cnt;
            if (i==0) total = sum[j];
            else total = sum[j] - sum[i-1];
            if (total%2!=0) continue;
            int left = i, right = j-1;
            while (left <= right) {
                int mid = (left + right) / 2;
                if (i==0) cnt = sum[mid];
                else cnt = sum[mid] - sum[i-1];
                if (2*cnt > total) right = mid-1;
                else if(2*cnt < total) left = mid+1;
                else {
                    answer = max(answer, cnt);
                    break;
                }
            }
        }
    }
    return answer;
}