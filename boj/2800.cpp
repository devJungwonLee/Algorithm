#include <iostream>
#include <stack>
#include <set>
using namespace std;

string s;
set<string> myset;

void recursive(int i, string result, stack<bool> st) {
    if (i == s.size()) {
        myset.insert(result);
        return;
    }
    char c = s[i];
    if (c=='(') {
        st.push(true);
        recursive(i+1, result+c, st);
        st.pop();
        st.push(false);
        recursive(i+1, result, st);
    } else if (c==')') {
        bool top = st.top();
        st.pop();
        if (top) recursive(i+1, result+c, st);
        else recursive(i+1, result, st);
    } else {
        recursive(i+1, result+c, st);
    }
}

int main(void) {
    cin >> s;
    stack<bool> st;
    recursive(0, "", st);
    myset.erase(s);
    for (auto str: myset) {
        cout << str << endl;
    }
}