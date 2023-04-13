#include <queue>
#include <map>
using namespace std;

queue<int> q;
map<int, int> v;

int solution(int x, int y, int n) {
    q.push(x);
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        if (num == y) return v[num];
        if (num+n <= y && v.find(num+n) == v.end()) {
            v[num+n] = v[num] + 1;
            q.push(num+n);
        }
        if (2*num <= y && v.find(2*num) == v.end()) {
            v[2*num] = v[num] + 1;
            q.push(2*num);
        }
        if (3*num <= y && v.find(3*num) == v.end()) {
            v[3*num] = v[num] + 1;
            q.push(3*num);
        }
    }
    return -1;
}