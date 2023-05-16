#include <string>
#include <vector>
#include <queue>
#include <map>
using namespace std;

int bfs(vector<string> &board, pair<int, int> start) {
    queue<pair<int, int>> q;
    map<pair<int, int>, int> v;
    int dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
    
    v[start] = 0;
    q.push(start);
    while (!q.empty()) {
        pair<int, int> current = q.front();
        int row = current.first;
        int col = current.second;
        q.pop();
        if (board[row][col] == 'G') {
            return v[current];
        }
        for (int i=0; i<4; i++) {
            int newr, newc;
            for (int j = 1; ; j++) {
                newr = row + j * dir[i][0];
                newc = col + j *dir[i][1];
                if (newr < 0 || newr == board.size() || newc < 0 || newc == board[0].size() || board[newr][newc] == 'D') {
                    newr -= dir[i][0];
                    newc -= dir[i][1];
                    break;
                }
            }
            pair<int, int> next = make_pair(newr, newc);
            if (v.find(next) != v.end()) continue;
            v[next] = v[current] + 1;
            q.push(next);
        }
    }
    return -1;
}

int solution(vector<string> board) {
    pair<int, int> start;
    for (int i=0; i<board.size(); i++) {
        for (int j=0; j<board[i].size(); j++) {
            if (board[i][j] == 'R') {
                start = make_pair(i, j);
                break;
            }
        }
    }
    return bfs(board, start);
}