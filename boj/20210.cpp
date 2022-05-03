#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int N;
vector<vector<string>> v;

bool isNumeric(char c) {
    if (c>='0' && c<='9') return true;
    else return false;
}

vector<string> makeVector(string s) {
    vector<string> v;
    string tmp = "";
    for (int i=0; i<s.size(); i++) {
        tmp += s[i];
        if (!isNumeric(s[i]) || !isNumeric(s[i+1])) {
            v.push_back(tmp);
            tmp = "";
        }
    }
    return v;
}

int compare(string a, string b) {
    int i = 0;
    while (a[i]=='0') i++;
    int j = 0;
    while (b[j]=='0') j++;
    if (a.size()-i < b.size()-j) return -1;
    else if (a.size()-i > b.size()-j) return 1;
    while (i<a.size()) {
        if (a[i]==b[j]) {
            i++;
            j++;
            continue;
        } else if (a[i]<b[j]) {
            return -1;
        } else return 1;
    }
    return 0;
}

char toUpperCase(char c) {
    if (c<='Z') return c;
    return c -'a' + 'A';
}

bool cmp(vector<string> &a, vector<string> &b) {
    int size = min(a.size(), b.size());
    for (int i=0; i<size; i++) {
        string sa = a[i];
        string sb = b[i];
        bool isANumeric = isNumeric(sa[0]);
        bool isBNumeric = isNumeric(sb[0]);
        if (isANumeric && isBNumeric) {
            int result = compare(sa, sb);
            if (result==-1) return true;
            else if (result==1) return false;
            else if (sa.size()==sb.size()) continue;
            else return sa.size() < sb.size();
        } else if (!isANumeric && !isBNumeric) {
            if (sa[0] == sb[0]) continue;
            char ca = toUpperCase(sa[0]);
            char cb = toUpperCase(sb[0]);
            if (ca == cb) return sa[0] < sb[0];
            else return ca < cb;
        } else if (isANumeric) {
            return true;
        } else {
            return false;
        }
    }
    return a.size() < b.size();
}

int main(void) {
    ios_base :: sync_with_stdio(false); 
    cin.tie(NULL); 
    cout.tie(NULL);
    cin >> N;
    for (int i=0; i<N; i++) {
        string s;
        cin >> s;
        v.push_back(makeVector(s));
    }
    sort(v.begin(), v.end(), cmp);
    for (auto vec: v) {
        string tmp = "";
        for (auto s: vec) tmp += s;
        cout << tmp << "\n";
    }
    return 0;
}