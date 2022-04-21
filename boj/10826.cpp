#include <iostream>
#include <stack>
using namespace std;

stack<char> sta, stb, stc;

string add(string a, string b) {
    int da, db, borrow = 0;
    for (auto c: a) sta.push(c);
    for (auto c: b) stb.push(c);
    while (!sta.empty() || !stb.empty()) {
        if (sta.empty()) da = 0;
        else {
            da = sta.top() - '0';
            sta.pop();
        }
        if (stb.empty()) db = 0;
        else {
            db = stb.top() - '0';
            stb.pop();
        }
        int sum = da + db + borrow;
        stc.push('0' + sum%10);
        borrow = sum/10;
    }
    if (borrow > 0) stc.push('0' + borrow);
    string result = "";
    while (!stc.empty()) {
        result += stc.top();
        stc.pop();
    }
    return result;
}

int main(void) {
    int n;
    string x = "0", y = "1", z;
    cin >> n;
    if (n==0) cout << x << endl;
    else if (n==1) cout << y << endl;
    else {
        for (int i=2; i<=n; i++) {
            z = add(x, y);
            x = y;
            y = z;
        }
        cout << z << endl;
    }
    return 0;
}