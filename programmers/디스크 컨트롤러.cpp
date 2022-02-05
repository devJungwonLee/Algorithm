#include <string>
#include <vector>
#include <queue>
#include <algorithm>
using namespace std;

struct cmp1 {
    bool operator()(vector<int> &a, vector<int> &b) {
        if (a[0] == b[0]) return a[1] > b[1];
        return a[0] > b[0];
    }   
};

struct cmp2 {
    bool operator()(vector<int> &a, vector<int> &b) {
        if (a[1] == b[1]) return a[0] > b[0];
        return a[1] > b[1];
    }
};

int solution(vector<vector<int>> jobs) {
    int answer = 0, t = 0;
    priority_queue<vector<int>, vector<vector<int>>, cmp1> pq1;
    priority_queue<vector<int>, vector<vector<int>>, cmp2> pq2;
    for (int i=0; i<jobs.size(); i++) pq1.push(jobs[i]);
    while (!pq1.empty()) {
        while (!pq1.empty() && pq1.top()[0]<=t) {
            pq2.push(pq1.top());
            pq1.pop();
        }
        if (pq2.empty()) t = pq1.top()[0];
        else {
            answer += (t + pq2.top()[1] - pq2.top()[0]);
            t += pq2.top()[1];
            pq2.pop();
            while (!pq2.empty()) {
                pq1.push(pq2.top());
                pq2.pop();
            }
        }
    }
    answer = answer / jobs.size();
    return answer;
}