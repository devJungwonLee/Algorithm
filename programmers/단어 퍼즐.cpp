#include <iostream>
#include <string>
#include <vector>
#include <algorithm>
#include <map>
using namespace std;

int solution(vector<string> strs, string t) {
    map<char, vector<string>> words;
    int d[20000];
    for (int i=0; i<t.size(); i++) d[i] = 10000;
    for (auto str: strs) {
        char last = str[str.size()-1];
        if (words.find(last) == words.end()) {
            words[last] = (vector<string>){str};
        } else words[last].push_back(str);
    }
    for (int i=0; i<t.size(); i++) {
        char c = t[i];
        for (auto word: words[c]) {
            int start = i - word.size();
            if (start < -1)  continue;
            else {
                string tmp = t.substr(start+1, word.size());
                if (tmp!=word) continue;
                if (start == -1) d[i] = min(d[i], 1);
                else d[i] = min(d[i], d[start]+1);
            }
        }
    }
    if (d[t.size()-1]>=10000) return -1;
    else return d[t.size()-1];
}