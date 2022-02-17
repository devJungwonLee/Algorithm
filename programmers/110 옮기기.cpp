#include <string>
#include <vector>
#include <iostream>
using namespace std;

string f(string str) {
    if (str.size()<3) return str;
    int cnt = 0;
    string result = "";
    for (int i=0; i<str.size(); i++) {
        result += str[i];
        if (result.size()>=3) {
            string three = result.substr(result.size()-3, 3);
            if (three == "110") {
                cnt++;
                result.erase(result.size()-3, 3);
            }
        }
    }
    if (cnt==0) return str;
    str = result;
    string add = "";
    for (int i=0; i<cnt; i++) add += "110";
    int i = str.rfind("0");
    string a = i<0 ? "" : str.substr(0, i+1);
    string b = i==str.size()-1 ? "" : str.substr(i+1, str.size()-1-i);
    return a + add + b;
}

vector<string> solution(vector<string> s) {
    vector<string> answer;
    for (auto str: s) {
        string result = f(str);
        answer.push_back(result);
    }
    return answer;
}