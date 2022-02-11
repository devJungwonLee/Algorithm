#include <string>
#include <vector>
#include <iostream>
using namespace std;

int duration[100];
string title[100], note[100];

vector<string> tokenize(string str) {
    vector<string> result;
    string tmp = "";
    for (int i=0; i<str.size(); i++) {
        if (str[i]==',') {
            result.push_back(tmp);
            tmp = "";
        } else tmp += str[i];
    }
    result.push_back(tmp);
    return result;
}

int time(string str) {
    int num1, num2, num3, num4;
    num1 = str[0] - '0';
    num2 = str[1] - '0';
    num3 = str[3] - '0';
    num4 = str[4] - '0';
    return (num1 * 10 + num2) * 60 + (num3 * 10 + num4);
}

void editNote(int idx) {
    string s = note[idx], result = "";
    int time = duration[idx];
    int j=0;
    for (int i=0; i<time; i++) {
        result += s[j++];
        if (j<s.size() && s[j]=='#') result += s[j++];
        if (j==s.size()) j=0;
    }
    note[idx] = result;
}

bool find(string m, int idx) {
    string n = note[idx];
    if (m.size() > n.size()) return false;
    for (int i=0; i<n.size(); i++) {
        if (n[i] != m[0]) continue;
        if (i + m.size() - 1 >= n.size()) return false;
        bool success = true;
        for (int j=0; j<m.size(); j++) {
            if (n[i+j] != m[j]) {
                success = false;
                break;
            } 
            if (j==m.size()-1 && i+j+1 < n.size() && n[i+j+1]=='#') {
                success = false;
                break;
            }
        }
        if (success) return true;
    }
    return false;
}

string solution(string m, vector<string> musicinfos) {
    vector<string> v;
    vector<int> indices;
    for (int i=0; i<musicinfos.size(); i++) {
        v = tokenize(musicinfos[i]);
        int start = time(v[0]);
        int end = time(v[1]);
        if (end < start) end = 1440;
        duration[i] = end - start;
        title[i] = v[2];
        note[i] = v[3];
        editNote(i);
        if (find(m, i)) indices.push_back(i);
    }
    int idx = -1;
    for (int i=0; i<indices.size(); i++) {
        if (i==0) idx = indices[i];
        else if (duration[indices[i]] > duration[idx]) idx = indices[i];
    }
    if (idx == -1) return "(None)";
    else return title[idx];
}