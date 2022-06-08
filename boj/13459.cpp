#include <iostream>
#include <vector>
#include <utility>
#include <set>
#include <queue>
using namespace std;

int N, M;
vector<vector<char> > a;
typedef pair<int, int> point;
set<pair<point, point> > s;
bool fail = false;

struct Node {
    point red;
    point blue;
    int cnt;
};

bool isRedFirst(point red, point blue, int dir) {
    if (dir==0 && red.first < blue.first) return true;
    if (dir==1 && red.second > blue.second) return true;
    if (dir==2 && red.first > blue.first) return true;
    if (dir==3 && red.second < blue.second) return true;
    return false;
}

void moveMarbles(point red, point blue, point& newRed, point& newBlue, int dir) {
    int direction[4][2] = {{-1,0}, {0,1}, {1,0}, {0,-1}};
    while (a[newRed.first][newRed.second]=='.') {
        newRed.first = newRed.first + direction[dir][0];
        newRed.second = newRed.second + direction[dir][1];
    }
    if (a[newRed.first][newRed.second]=='#') {
        newRed.first = newRed.first - direction[dir][0];
        newRed.second = newRed.second - direction[dir][1];
    }
    while (a[newBlue.first][newBlue.second]=='.') {
        newBlue.first = newBlue.first + direction[dir][0];
        newBlue.second = newBlue.second + direction[dir][1];
    }
    if (a[newBlue.first][newBlue.second]=='#') {
        newBlue.first = newBlue.first - direction[dir][0];
        newBlue.second = newBlue.second - direction[dir][1];
    }
    if (newRed == newBlue && a[newRed.first][newRed.second] != 'O') {
        if (isRedFirst(red, blue, dir)) {
            newBlue.first = newRed.first - direction[dir][0];
            newBlue.second = newRed.second - direction[dir][1];
        } else {
            newRed.first = newBlue.first - direction[dir][0];
            newRed.second = newBlue.second - direction[dir][1];
        }
    }
}

int main(void) {
    char c;
    point red, blue;
    queue<Node> q;

    scanf("%d %d", &N, &M);
    getchar();
    for (int i=0; i<N; i++) {
        vector<char> tmp;
        for (int j=0; j<M; j++) {
            scanf("%c", &c);
            if (c=='R') red = make_pair(i, j);
            else if (c=='B') blue = make_pair(i, j);
            if (c=='R' || c=='B') c = '.';
            tmp.push_back(c);
        }
        getchar();
        a.push_back(tmp);
    }

    s.insert(make_pair(red, blue));
    q.push((Node){red, blue, 0});
    while (!q.empty()) {
        point red = q.front().red;
        point blue = q.front().blue;
        int cnt = q.front().cnt;
        q.pop();
        if (a[red.first][red.second]=='O') {
            if (red!=blue) {
                printf("1\n");
                return 0;
            }
        }
        if (a[blue.first][blue.second]=='O') continue;
        for (int i=0; i<4; i++) {
            point newRed = red;
            point newBlue = blue;
            moveMarbles(red, blue, newRed, newBlue, i);
            if (s.find(make_pair(newRed, newBlue)) != s.end()) continue;
            int newCnt = cnt + 1;
            if (newCnt > 10) continue;
            s.insert(make_pair(newRed, newBlue));
            q.push((Node){newRed, newBlue, newCnt});
        }
    }
    printf("0\n");
    return 0;
}