#include <string>
#include <vector>
#include <utility>
#include <queue>
#include <algorithm>
#include <map>
#include <set>
using namespace std;


bool v[2][50][50];
int N, answer = 0;
queue<pair<int, int>> q;
map<int, vector<vector<vector<int>>>> m[2];

void bfs(vector<vector<int>> a, int x) {
    int dir[4][2] = {{-1,0}, {0,1}, {1,0}, {0,-1}};
    int minR = 100, minC = 100, maxR = 0, maxC = 0, cnt = 0;
    
    while (!q.empty()) {
        int r = q.front().first;
        int c = q.front().second;
        q.pop();
        cnt++;
        minR = min(minR, r);
        maxR = max(maxR, r);
        minC = min(minC, c);
        maxC = max(maxC, c);
        for (int i=0; i<4; i++) {
            int newr = r + dir[i][0];
            int newc = c + dir[i][1];
            if (newr<0 || newr>=N || newc<0 || newc>=N) continue;
            if (a[newr][newc]!=x || v[x][newr][newc]) continue;
            v[x][newr][newc] = true;
            q.push(make_pair(newr, newc));
        }
    }
    
    vector<vector<int>> vec;
    for (int i=minR; i<=maxR; i++) {
        vector<int> tmp;
        for (int j=minC; j<=maxC; j++) tmp.push_back(a[i][j]);
        vec.push_back(tmp);
    }
    m[x][cnt].push_back(vec);
}

void f(vector<vector<int>> a, int x) {
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            if (a[i][j]!=x || v[x][i][j]) continue;
            v[x][i][j] = true;
            q.push(make_pair(i, j));
            bfs(a, x);
        }
    }
}

vector<vector<int>> rotate(vector<vector<int>> a) {
    vector<vector<int>> b;
    for (int i=0; i<a[0].size(); i++) {
        vector<int> tmp;
        for (int j=0; j<a.size(); j++) {
            tmp.push_back(a[a.size()-1-j][i]);
        }
        b.push_back(tmp);
    }
    return b;
}

bool check(vector<vector<int>> t, vector<vector<int>> b) {
    int br = b.size(), bc = b[0].size();
    int tr = t.size(), tc = t[0].size();
    if (!((br==tr&&bc==tc)||(br==tc&&bc==tr))) return false;
    for (int k=0; k<4; k++) {
        int tr = t.size(), tc = t[0].size();
        if (br!=tr||bc!=tc) {
            t = rotate(t);
            continue;
        }
        bool flag = true;
        for (int i=0; i<t.size(); i++) {
            for (int j=0; j<t[0].size(); j++) {
                if (t[i][j]+b[i][j]!=1) {
                    flag = false;
                    break;
                }
            }
            if (!flag) break;
        }
        if (flag) return true;
        if (k==3) return false;
        t = rotate(t);
    }
    return false;
}

int solution(vector<vector<int>> game_board, vector<vector<int>> table) {
    N = table.size();
    f(game_board, 0);
    f(table, 1);
    for (auto it = m[1].begin(); it != m[1].end(); it++) {
        int num = it->first;
        if (m[0].find(num) == m[0].end()) continue;
        vector<vector<vector<int>>> t = it->second, b = m[0][num];
        set<int> done;
        for (int k=0; k<t.size(); k++) {
            for (int l=0; l<b.size(); l++) {
                if (done.find(l) != done.end()) continue;
                if (check(t[k], b[l])) {
                    answer += num;
                    done.insert(l);
                    break;
                }
            }
        }
    }
    return answer;
}