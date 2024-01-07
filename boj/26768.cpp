#include <iostream>
#include <map>
#include <string>
using namespace std;

map<char, string> d = {{'a', "4"}, {'e', "3"}, {'i', "1"}, {'o', "0"}, {'s', "5"}};
string s, t = "";

int main(void) {
    cin >> s;
    for (auto c: s) {
        if (d.find(c) == d.end()) t += c;
        else t += d[c];
    }
    cout << t << endl;
    return 0;
}