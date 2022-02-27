#include <string>
#include <vector>
#include <queue>
#include <utility>
#include <map>
#include <algorithm>
using namespace std;

bool check(vector<pair<int, int>> v, vector<string> board, char c) {
    bool result = true;
    int r1, c1, r2, c2;
    r1 = v[0].first;
    c1 = v[0].second;
    r2 = v[1].first;
    c2 = v[1].second;
    for (int j=min(c1, c2); j<=max(c1, c2); j++) {
        if (board[r1][j]!=c && board[r1][j]!='.') {
            result = false;
            break;
        }
    }
    for (int i=min(r1, r2); i<=max(r1, r2); i++) {
        if (board[i][c2]!=c && board[i][c2]!='.') {
            result = false;
            break;
        }
    }
    if (result) return true;
    result = true;
    for (int j=min(c1, c2); j<=max(c1, c2); j++) {
        if (board[r2][j]!=c && board[r2][j]!='.') {
            result = false;
            break;
        }
    }
    for (int i=min(r1, r2); i<=max(r1, r2); i++) {
        if (board[i][c1]!=c && board[i][c1]!='.') {
            result = false;
            break;
        }
    }
    if (result) return true;
    else return false;
}

string solution(int m, int n, vector<string> board) {
    priority_queue<char, vector<char>, greater<char>> pq[2];
    map<char, vector<pair<int ,int>>> myMap;
    int turn = 0, prev = 0;
    string answer = "";
    for (int i=0; i<m; i++) {
        for (int j=0; j<n; j++) {
            char c = board[i][j];
            if (c>='A' && c<='Z') {
                pair<int, int> p = make_pair(i, j);
                if (myMap.find(c) == myMap.end()) {
                    vector<pair<int, int>> v;
                    v.push_back(p);
                    myMap[c] = v;
                } else myMap[c].push_back(p);
            }
        }
    }
    for (auto it = myMap.begin(); it != myMap.end(); it++) pq[0].push(it->first);
    while (prev != pq[turn].size()) {
        prev = pq[turn].size();
        while(!pq[turn].empty()) {
            char c = pq[turn].top();
            pq[turn].pop();
            vector<pair<int, int>> v = myMap[c];
            if (check(v, board, c)) {
                answer += c;
                board[v[0].first][v[0].second] = '.';
                board[v[1].first][v[1].second] = '.';
                while (!pq[1-turn].empty()) {
                    pq[turn].push(pq[1-turn].top());
                    pq[1-turn].pop();
                }
            }
            else pq[1-turn].push(c);
        }
        turn = 1 - turn;
    }
    if (answer.size()!=myMap.size()) answer = "IMPOSSIBLE";
    return answer;
}