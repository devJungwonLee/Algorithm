#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <queue>
using namespace std;

vector<vector<int>> allCases;
int choice[20];

void f(int depth, int k, int n) {
    if (depth == n-k) {
        vector<int> counts;
        for (int i=0; i<k; i++) counts.push_back(1);
        for (int i=0; i<n-k; i++) counts[choice[i]]++;
        allCases.push_back(counts);
        return;
    }
    int start = depth == 0 ? 0 : choice[depth-1];
    for (int i=start; i<k; i++) {
        choice[depth] = i;
        f(depth + 1, k, n);
    }
}

int waitingTime(vector<int> c, vector<vector<int>> reqs) {
    int sum = 0;
    vector<priority_queue<int, vector<int>, greater<int>>> pqs;
    for (int i=0; i<c.size(); i++) {
        priority_queue<int, vector<int>, greater<int>> pq;
        for (int j=0; j<c[i]; j++) pq.push(0);
        pqs.push_back(pq);
    }
    for (auto req: reqs) {
        int reqTime = req[0];
        int duration = req[1];
        int type = req[2]-1;
        int fastEndTime = pqs[type].top();
        if (reqTime > fastEndTime) fastEndTime = reqTime; 
        pqs[type].pop();
        int waitingTime = max(0, fastEndTime - reqTime);
        pqs[type].push(fastEndTime + duration);
        sum += waitingTime;
    }
    return sum;
}

int solution(int k, int n, vector<vector<int>> reqs) {
    int answer = 999999999;
    f(0, k, n);
    for (auto c: allCases) {
        int time = waitingTime(c, reqs);
        answer = min(answer, time);
    }
    return answer;
}