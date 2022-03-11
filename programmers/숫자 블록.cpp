#include <string>
#include <vector>

using namespace std;

long long findBlockNum(long long num) {
    if (num==1) return 0;
    for (long long i=2; i*i<=num; i++) {
        if (num%i==0) {
            if (num/i > 10000000) continue;
            return num/i;
        }
    }
    return 1;
}

vector<int> solution(long long begin, long long end) {
    vector<int> answer;
    for (long long i=begin; i<=end; i++) {
        answer.push_back(findBlockNum(i));
    }
    return answer;
}