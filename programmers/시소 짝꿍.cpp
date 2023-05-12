#include <string>
#include <vector>
#include <map>
using namespace std;
map<int, long long> m;

long long solution(vector<int> weights) {
    long long answer = 0;
    for (auto weight: weights) m[weight]++;
    for (auto x: m) {
        int a = x.first;
        answer += m[a] * (m[a] - 1) / 2;
        int b;
        if (a * 3 % 2 == 0) {
            b = a * 3 / 2;
            if (m.find(b) != m.end()) answer += m[a] * m[b];
        }
        if (a * 4 % 3 == 0) {
            b = a * 4 / 3;
            if (m.find(b) != m.end()) answer += m[a] * m[b];
        }
        b = a * 2;
        if (m.find(b) != m.end()) answer += m[a] * m[b];
    }
    return answer;
}