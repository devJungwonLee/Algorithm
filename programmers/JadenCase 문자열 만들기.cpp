#include <string>
#include <vector>

using namespace std;

char upper(char c) {
    if (c>='a' && c<='z') return c - 'a' + 'A';
    else return c;
}

char lower(char c) {
    if (c>='A' && c<='Z') return c - 'A' + 'a';
    else return c;
}

string solution(string s) {
    string answer = "";
    for (int i=0; i<s.size(); i++) {
        if (i==0 || s[i-1] == ' ') answer += upper(s[i]);
        else answer += lower(s[i]);
    }
    return answer;
}