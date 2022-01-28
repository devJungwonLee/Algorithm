#include <iostream>
#include <stack>
#include <map>
using namespace std;

int main(void) {
    string str;
    stack<char> s;
    map<char, int> priority;
    priority['+'] = 0;
    priority['-'] = 0;
    priority['*'] = 100;
    priority['/'] = 100;
    priority['('] = -100;
    cin >> str;
    for (int i=0; i<str.size(); i++) {
        char c = str[i];
        if (c>='A' && c<='Z') cout << c;
        else if (c=='(') s.push(c);
        else if (c==')') {
            while (s.top()!='(') {
                cout << s.top();
                s.pop();
            }
            s.pop();
        } 
        else {
            while (!s.empty() && priority[s.top()] >= priority[c]) {
                cout << s.top();
                s.pop();
            }
            s.push(c);
        }
    }
    while (!s.empty()) {
        cout << s.top();
        s.pop();
    }
    cout << endl;
    return 0;
}