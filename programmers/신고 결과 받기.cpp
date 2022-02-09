#include <string>
#include <vector>
#include <map>
#include <set>

using namespace std;
map<string, set<string>> reporter;
map<string, int> cnt;

vector<string> split(string str) {
    vector<string> v;
    string tmp = "";
    for (int i=0; i<str.size(); i++) {
        if (str[i] == ' ') {
            v.push_back(tmp);
            tmp = "";
        } else tmp += str[i];
    }
    v.push_back(tmp);
    return v;
}

vector<int> solution(vector<string> id_list, vector<string> report, int k) {
    vector<int> answer;
    for (int i=0; i<report.size(); i++) {
        vector<string> r = split(report[i]);
        reporter[r[1]].insert(r[0]);
    }
    for (auto it = reporter.begin(); it != reporter.end(); it++) {
        set<string> s = it->second;
        if (s.size()<k) continue;
        for (auto it2 = s.begin(); it2 != s.end(); it2++) {
            cnt[*it2]++;
        }
    }
    for(int i=0; i<id_list.size(); i++) {
        string id = id_list[i];
        answer.push_back(cnt[id]);
    }
    return answer;
}