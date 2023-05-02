#include <string>
#include <stack>
#include <queue>
#include <vector>

using namespace std;
stack<int> s;
queue<int> q;

int solution(vector<int> order) {
    int answer = 0;
    for (int i=1; i<=order.size(); i++) q.push(i);
    for (auto num: order) {
        while (!q.empty() && q.front() < num) {
            s.push(q.front());
            q.pop();
        }
        if (!q.empty() && q.front() == num) {
            answer++;
            q.pop();
        } else {
            if (s.empty() || s.top() != num) break;
            while (!s.empty() && s.top() == num) {
                answer++;
                s.pop();
            }
        } 
    }
    return answer;
}