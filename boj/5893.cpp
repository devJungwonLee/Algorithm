#include <iostream>
#include <stack>
using namespace std;

string sum(string a, string b) {
    stack<char> sta, stb, result;
    string s = "";
    int numa, numb, olim=0;
    for (auto c: a) sta.push(c);
    for (auto c: b) stb.push(c);
    while (!sta.empty() || !stb.empty()) {
        if (!sta.empty()) {
            numa = sta.top() - '0';
            sta.pop();
        }
        else numa = 0;
        if (!stb.empty()) {
            numb = stb.top() - '0';
            stb.pop();
        }
        else numb = 0;
        int sum = numa + numb + olim;
        olim = sum / 2;
        result.push(sum%2 + '0');
    }
    if (olim == 1) result.push('1');
    while (!result.empty()) {
        s += result.top();
        result.pop();
    }
    return s;
}

int main(void) {
    string s;
    cin >> s;
    cout << sum(s, s+"0000") << endl;
    return 0;
}