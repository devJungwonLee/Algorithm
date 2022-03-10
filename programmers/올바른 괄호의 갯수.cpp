#include <string>
#include <vector>
#include <set>
using namespace std;

int answer = 0;

void dfs(int open, int close, int n) {
    if (open < n) {
        dfs(open+1, close, n);
        if (open > close) dfs(open, close+1, n);
    } else {
        if (close < n) dfs(open, close+1, n);
        else answer++;
    }
}

int solution(int n) {
    dfs(1, 0, n);
    return answer;
}