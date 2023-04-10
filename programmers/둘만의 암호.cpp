#include <string>
#include <vector>
#include <set>
using namespace std;
set<char> mySet;

string solution(string s, string skip, int index) {
    string answer = "";
    for (auto c: skip) mySet.insert(c);
    for (auto c: s) {
        int newc = c;
        for (int cnt=0; cnt<index; ) {
            newc++;
            if (newc > 'z') newc = 'a';
            if (mySet.find(newc) == mySet.end()) cnt++;
        }
        answer.push_back(newc);
    }
    return answer;
}