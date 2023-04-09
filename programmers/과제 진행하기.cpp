#include <string>
#include <vector>
#include <cstring>
#include <queue>
#include <iostream>
using namespace std;

struct Homework {
    string name;
    int startOrEnd;
    int playTime;
};

struct cmp1 {
    bool operator()(Homework &a, Homework &b) {
        return a.startOrEnd > b.startOrEnd;
    }
};

struct cmp2 {
    bool operator()(Homework &a, Homework &b) {
        return a.startOrEnd < b.startOrEnd;
    }
};

priority_queue<Homework, vector<Homework>, cmp1> pq1;
priority_queue<Homework, vector<Homework>, cmp2> pq2;
int current = 0;

int toIntTime(string time) {
    char str[6];
    strcpy(str, time.c_str());
    int m, s;
    sscanf(str, "%d:%d", &m, &s);
    return m * 60 + s;
}

vector<string> solution(vector<vector<string>> plans) {
    vector<string> answer;
    for (auto plan: plans) {
        string name = plan[0];
        int start = toIntTime(plan[1]);
        int playTime = stoi(plan[2]);
        pq1.push({name, start, playTime});
    }
    while (answer.size() < plans.size()) {
        if (!pq1.empty()) {
            int nextStart = pq1.top().startOrEnd;
            if (current < nextStart) {
                if (!pq2.empty()) {
                    Homework h = pq2.top();
                    pq2.pop();
                    if (current + h.playTime > nextStart) {
                        int playTime = current + h.playTime - nextStart;
                        current = nextStart;
                        pq2.push({h.name, current, playTime});
                    } else {
                        answer.push_back(h.name);
                        current += h.playTime;
                    }
                } else {
                    current = nextStart;
                }
            } else {
                Homework h = pq1.top();
                pq1.pop();
                if (!pq1.empty()) {
                    nextStart = pq1.top().startOrEnd;
                    if (current + h.playTime > nextStart) {
                        int playTime = current + h.playTime - nextStart;
                        current = nextStart;
                        pq2.push({h.name, current, playTime});
                    } else {
                        answer.push_back(h.name);
                        current += h.playTime;
                    }
                } else {
                    answer.push_back(h.name);
                    current += h.playTime;
                }
            }
        } else {
            while (!pq2.empty()) {
                Homework h = pq2.top();
                pq2.pop();
                answer.push_back(h.name);
            }
        }
    }
    return answer;
}