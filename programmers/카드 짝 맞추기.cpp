#include <string>
#include <vector>
#include <utility>
#include <map>
#include <algorithm>
#include <queue>
using namespace std;

pair<int, int> start;
map<int, vector<pair<int, int>>> dict;
int answer = 1000000;

int dist(pair<int, int> from, pair<int, int> to, vector<vector<int>> b) {
    int v[4][4], dir[4][2] = {{-1,0}, {0,1}, {1,0}, {0,-1}};
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) v[i][j] = -1;
    }
    queue<pair<int, int>> q;
    v[from.first][from.second] = 0;
    q.push(from);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        if (make_pair(row, col) == to) return v[row][col];
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<0 || newr>=4 || newc<0 || newc>=4) continue;
            if (v[newr][newc] == -1) {
                v[newr][newc] = v[row][col] + 1;
                q.push(make_pair(newr, newc));
            }
            if (dir[i][0] != 0) {
                while (newr>0 && newr<3 && b[newr][newc] == 0) newr += dir[i][0];
            }
            if (dir[i][1] != 0) {
                while (newc>0 && newc<3 && b[newr][newc] == 0) newc += dir[i][1];
            }
            if (v[newr][newc] == -1) {
                v[newr][newc] = v[row][col] + 1;
                q.push(make_pair(newr, newc));
            }
        }
    }
}

int find(vector<int> a, vector<vector<int>> b, int num) {
    map<int, vector<pair<int, int>>> tmpDict = dict;
    for (int i=1; i<=tmpDict.size(); i++) {
        vector<pair<int, int>> v = tmpDict[i];
        if (num%2==1) {
            pair<int, int> tmp = tmpDict[i][0];
            tmpDict[i][0] = tmpDict[i][1];
            tmpDict[i][1] = tmp;
        }
        num/=2;
    }
    pair<int, int> p = start;
    int sum = 0;
    for (int i=0; i<a.size(); i++) {
        pair<int, int> f = tmpDict[a[i]][0];
        pair<int, int> s = tmpDict[a[i]][1];
        int df = dist(p, f, b);
        int ds = dist(p, s, b);
        sum += df + 1;
        p = f;
        sum += dist(f, s, b) + 1;
        p = s;
        b[f.first][f.second] = 0;
        b[s.first][s.second] = 0;
    }
    return sum;
}
    
int solution(vector<vector<int>> board, int r, int c) {
    start = make_pair(r, c);
    for (int i=0; i<4; i++) {
        for (int j=0; j<4; j++) {
            int k = board[i][j];
            if (k==0) continue;
            if (dict.find(k) == dict.end()) {
                vector<pair<int, int>> v;
                v.push_back(make_pair(i, j));
                dict[k] = v;
            }  else dict[k].push_back(make_pair(i, j));
        }
    }
    int n = dict.size();
    int m = 1 << n;
    vector<int> v;
    for (int i=1; i<=n; i++) v.push_back(i);
    do {
        for (int i=0; i<m; i++) {
            int tmp = find(v, board, i);
            answer = min(answer, tmp);
        }
    } while(next_permutation(v.begin(), v.end()));
    return answer;
}