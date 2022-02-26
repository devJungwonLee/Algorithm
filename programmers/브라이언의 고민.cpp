#include <string>
#include <set>
using namespace std;

string s;

bool isUpper(char c) {
    if (c>='A' && c<='Z') return true;
    else return false;
}

bool getType(int i) {
    int cnt = 0;
    for (int j=i+1; j<s.size(); j++) {
        if (s[j] == s[i+1]) cnt++;
    }
    if (cnt==1 || cnt>=3) return 1;
    else return 0;
}

string solution(string sentence) {
    string answer = "";
    int type = 0;
    char lower1, lower2;
    set<char> mySet;
    
    s = sentence;
    for (int i=0; i<s.size(); i++) {
        char now = s[i];
        if (isUpper(now)) {
            if (type==0) {
                if (i>0) answer += " ";
                if (i+1<s.size() && !isUpper(s[i+1])) {
                    type = getType(i);
                    if (type==1) {
                        if (mySet.find(s[i+1]) != mySet.end()) return "invalid";
                        lower1 = s[i+1];
                        mySet.insert(lower1);
                    }
                }
            } else if (type==1 || type==3) {
                if (i+1<s.size() && isUpper(s[i+1])) type = 0;
            } else if (type==2) {
                if (i==s.size()-1) return "invalid";
            }
            answer += now;
        } else {
            if (type==0) {
                if (i>0) answer += " ";
                type = 2;
                if (mySet.find(now) != mySet.end()) return "invalid";
                if (i+1==s.size() || !isUpper(s[i+1])) return "invalid";
                lower2 = now;
                mySet.insert(lower2);
            } else if (type==1 || type==3) {
                if (now != lower1) {
                    if (type==1) {
                        type = 2;
                        answer += " ";
                        if (mySet.find(now) != mySet.end()) return "invalid";
                        if (i+1==s.size() || !isUpper(s[i+1])) return "invalid";
                        lower2 = now;
                        mySet.insert(lower2); 
                    } else {
                        if (now != lower2) return "invalid";
                        else type = 0;
                    }
                    
                } else {
                    if (i+1==s.size() || !isUpper(s[i+1])) return "invalid";
                }
            } else if (type==2) {
                if (now != lower2) {
                    type = 3;
                    if (mySet.find(now) != mySet.end()) return "invalid";
                    if (i+1==s.size() || !isUpper(s[i+1])) return "invalid";
                    lower1 = now;
                    mySet.insert(lower1);
                }
                else type = 0;
            }
        }
    }
    return answer;
}