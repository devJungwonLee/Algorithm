#include <string>
#include <vector>
#include <utility>
#include <queue>
#include <map>
using namespace std;

queue<pair<int, int>> q;
map<pair<float, float>, int> m;

void mark(int r1, int c1, int r2, int c2) {
    for (float i=r1; i<=r2; i+=0.5) {
        for (float j=c1; j<=c2; j+=0.5) {
            if ((int)i!=i && (int)j!=j) continue;
            if (i==r1||i==r2||j==c1||j==c2) {
                if (m[make_pair(i, j)] != 1) m[make_pair(i, j)] = 2;
            } else m[make_pair(i, j)] = 1;
        }
    }
}

int bfs(int startR, int startC, int endR, int endC) {
    int dir[4][2] = {{-1,0}, {0,1}, {1,0}, {0,-1}};
    
    m[make_pair((float)startR, (float)startC)] = 3;
    q.push(make_pair(startR, startC));
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        if(row == endR && col == endC) {
            return m[make_pair((float)endR, (float)endC)] - m[make_pair((float)startR, (float)startC)];
        }
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<1||newr>50||newc<1||newc>50) continue;
            if (m[make_pair((float)newr, (float)newc)]!=2) continue;
            float r = (float)(row+newr)/2;
            float c = (float)(col+newc)/2;
            if (m[make_pair(r, c)]!=2) continue;
            m[make_pair((float)newr, (float)newc)] = m[make_pair((float)row, (float)col)] + 1;
            q.push(make_pair(newr, newc));
        }
    }
    return 0;
}

int solution(vector<vector<int>> rectangle, int characterX, int characterY, int itemX, int itemY) {
    for (int i=0; i<rectangle.size(); i++) {
        int r1 = rectangle[i][0];
        int c1 = rectangle[i][1];
        int r2 = rectangle[i][2];
        int c2 = rectangle[i][3];
        mark(r1, c1, r2, c2);
    }
    int answer = bfs(characterX, characterY, itemX, itemY);
    return answer;
}