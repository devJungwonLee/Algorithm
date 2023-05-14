#include <string>
#include <vector>
#include <queue>
using namespace std;

priority_queue<int, vector<int>, less<int>> pq;

int solution(int n, int k, vector<int> enemy) {
    int answer = 0;
    int current = n;
    for (int i=0; i<enemy.size(); i++) {
        int e = enemy[i];
        if (current >= e) {
            current -= e;
            pq.push(e);
            answer++;
        } else {
            if (k == 0) return answer;
            if (!pq.empty() && pq.top() >= e) {
                current += pq.top();
                pq.pop();
                k--;
                i--;
            } else {
                k--;
                answer++;
            }
        }
    }
    return answer;
}