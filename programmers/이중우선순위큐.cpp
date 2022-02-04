#include <string>
#include <vector>
#include <queue>
#include <map>

using namespace std;
priority_queue<int> maxHeap;
priority_queue<int, vector<int>, greater<int>> minHeap;
map<int, int> cnt;

vector<string> tokenize(string str) {
    string tmp = "";
    vector<string> result;
    for (int i=0; i<str.size(); i++) {
        if (str[i] == ' ') {
            result.push_back(tmp);
            tmp = "";
        } else {
            tmp += str[i];
        }
    }
    result.push_back(tmp);
    return result;
}

vector<int> solution(vector<string> operations) {
    vector<int> answer;
    vector<string> v;
    for (int i=0; i<operations.size(); i++) {
        v = tokenize(operations[i]);
        int num = stoi(v[1]);
        if (v[0] == "I") {
            maxHeap.push(num);
            minHeap.push(num);
            cnt[num]++;
        } else {
            if (num==1) {
                while (!maxHeap.empty() && cnt[maxHeap.top()] == 0) maxHeap.pop();
                if (!maxHeap.empty()) {
                    cnt[maxHeap.top()]--;
                    maxHeap.pop();
                }
            } else {
                while (!minHeap.empty() && cnt[minHeap.top()] == 0) minHeap.pop();
                if (!minHeap.empty()) {
                    cnt[minHeap.top()]--;
                    minHeap.pop();
                }
            }
        }
    }
    while (!maxHeap.empty() && cnt[maxHeap.top()] == 0) maxHeap.pop();
    while (!minHeap.empty() && cnt[minHeap.top()] == 0) minHeap.pop();
    if (maxHeap.empty()) {
        answer.push_back(0);
        answer.push_back(0);
    } else {
        answer.push_back(maxHeap.top());
        answer.push_back(minHeap.top());
    }
    return answer;
}