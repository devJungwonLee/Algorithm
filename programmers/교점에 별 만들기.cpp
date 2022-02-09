#include <string>
#include <vector>
#include <set>
#include <utility>
#include <algorithm>
using namespace std;

set<pair<long long, long long>> s;

vector<string> solution(vector<vector<int>> line) {
    vector<string> answer;
    long long minX = 1e15, maxX = -1e15, minY = 1e15, maxY = -1e15;
    for (int i=0; i<line.size(); i++) {
        for (int j=i+1; j<line.size(); j++) {
            long long a, b, c, d, e, f;
            a = line[i][0];
            b = line[i][1];
            e = line[i][2];
            c = line[j][0];
            d = line[j][1];
            f = line[j][2];
            long long boonmo = a*d-b*c;
            if (boonmo==0) continue;
            long long xboonja = b*f-e*d;
            long long yboonja = e*c-a*f;
            if (xboonja%boonmo==0 && yboonja%boonmo==0) {
                long long x = xboonja/boonmo;
                long long y = yboonja/boonmo;
                minX = min(minX, x);
                maxX = max(maxX, x);
                minY = min(minY, y);
                maxY = max(maxY, y);
                s.insert(make_pair(x, y));
            }
        }
    }
    for (long long i=maxY; i>=minY; i--) {
        string tmp = "";
        for (long long j=minX; j<=maxX; j++) {
            if (s.find(make_pair(j, i))==s.end()) tmp+=".";
            else tmp+="*";
        }
        answer.push_back(tmp);
    }
    return answer;
}