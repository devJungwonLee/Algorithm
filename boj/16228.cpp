#include <iostream>
#include <stack>
#include <vector>
#include <map>
#include <algorithm>
using namespace std;

int main(void) {
    string s, num = "";
    stack<char> st;
    stack<int> numst;
    vector<string> v;
    map<char, int> priority = {{'+', 0}, {'-', 0}, {'<', 1}, {'>', 1}, {'(', -1}};

    cin >> s;
    for (auto c: s) {
        if (c=='?') continue;
        if (c>='0'&&c<='9') num += c;
        else {
            if (num!="") {
                v.push_back(num);
                num = "";
            }
            if (c=='(') st.push(c);
            else if (c==')') {
                while (st.top()!='(') {
                    string tmp(1, st.top());
                    v.push_back(tmp);
                    st.pop();
                }
                st.pop();
            } else {
                while (!st.empty() && priority[st.top()] >= priority[c]) {
                    string tmp(1, st.top());
                    v.push_back(tmp);
                    st.pop();
                }
                st.push(c);
            }
        }
    }
    if (num!="") v.push_back(num);
    while (!st.empty()) {
        string tmp(1, st.top());
        v.push_back(tmp);
        st.pop();
    }
    
    for(auto str: v) {
        if (str=="+"||str=="-"||str=="<"||str==">") {
            int right = numst.top();
            numst.pop();
            int left = numst.top();
            numst.pop();
            if (str=="+") numst.push(left+right);
            else if (str=="-") numst.push(left-right);
            else if (str=="<") numst.push(min(left,right));
            else if (str==">") numst.push(max(left,right));
        } else numst.push(stoi(str));
    }
    printf("%d\n", numst.top());
    return 0;
}
