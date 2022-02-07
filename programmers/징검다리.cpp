#include <string>
#include <vector>
#include <algorithm>

using namespace std;

int solution(int distance, vector<int> rocks, int n) {
    int answer, left = 1, right = distance, mid;
    sort(rocks.begin(), rocks.end());
    rocks.push_back(distance);
    while (left <= right) {
        int cnt = 0, d, start = 0;
        mid = (left + right) / 2;
        for (int i=0; i<rocks.size(); i++) {
            d = rocks[i] - start;
            if (d < mid && i < rocks.size()-1) cnt++;
            else if (i < rocks.size()-1) start = rocks[i];
        }
        if (d < mid || cnt > n) right = mid-1;
        else left = mid+1;
    }
    answer = right;
    return answer;
}