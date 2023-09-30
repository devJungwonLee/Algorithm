#include <iostream>
#include <vector>
#include <utility>
#include <set>
#include <queue>
using namespace std;

struct Group {
    int size;
    int rainbow;
    pair<int, int> standard;
    vector<pair<int, int> > blocks;
};

int N, M, a[20][20], dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
int points = 0;

Group findGroup(int i, int j, set<pair<int, int> > &v, vector<pair<int, int> > &rainbows) {
    int size = 0, rainbow = 0;
    int color = a[i][j];
    pair<int, int> standard = make_pair(i, j);
    pair<int, int> start = make_pair(i, j);
    v.insert(start);
    queue<pair<int, int> > q;
    q.push(start);
    vector<pair<int, int> > blocks;
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        blocks.push_back(q.front());
        q.pop();
        size++;
        if (a[row][col] == 0) {
            rainbows.push_back(make_pair(row, col));
            rainbow++;
        } else if (row < standard.first || row == standard.first && col < standard.second) {
            standard = make_pair(row, col);
        }
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr < 0 || newr >= N || newc < 0 || newc >= N) continue;
            if (v.find(make_pair(newr, newc)) != v.end()) continue;
            if (a[newr][newc] != 0 && a[newr][newc] != color) continue;
            v.insert(make_pair(newr, newc));
            q.push(make_pair(newr, newc));
        }
    }
    return {size, rainbow, standard, blocks};
}

vector<Group> findGroups() {
    vector<Group> result;
    set<pair<int, int> > v;
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            if (v.find(make_pair(i, j)) != v.end()) continue;
            if (a[i][j] <= 0) continue;
            vector<pair<int, int> > rainbows;
            Group group = findGroup(i, j, v, rainbows);
            if (group.size < 2) continue;
            result.push_back(group);
            for (auto r: rainbows) v.erase(r);
        }
    }
    return result;
}

void fall() {
    for (int j=0; j<N; j++) {
        int i = N-1, k;
        while (i >= 0) {
            if (a[i][j] != -2) {
                i--;
                continue;
            }
            k = i -1;
            while (k >= 0 && a[k][j] == -2) k--;
            if (k < 0) break;
            if (a[k][j] == -1) {
                i --;
                continue;
            }
            a[i][j] = a[k][j];
            a[k][j] = -2;
            i--;
        }
    }
}

void rotate() {
    vector<vector<int> > result;
    for (int j=N-1; j>=0; j--) {
        vector<int> col;
        for (int i=0; i<N; i++) col.push_back(a[i][j]);
        result.push_back(col);
    }
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) a[i][j] = result[i][j];
    }
}

bool compare(Group x, Group y) {
    if (y.size == x.size) {
        if (y.rainbow == x.rainbow) {
            if (y.standard.first == x.standard.first) {
                return y.standard.second > x.standard.second;
            }
            return y.standard.first > x.standard.first;
        }
        return y.rainbow > x.rainbow;
    }
    return y.size > x.size;
}

int main(void) {
    scanf("%d %d", &N, &M);
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            scanf("%d", &a[i][j]);
        }
    }

    while (true) {
        vector<Group> groups = findGroups();
        if (groups.empty()) break;
        Group &target = groups.front();
        for (auto &group: groups) {
            if (compare(target, group)) target = group;
        }
        for (auto block: target.blocks) a[block.first][block.second] = -2;
        points += target.size * target.size;
        fall();
        rotate();
        fall();
    }
    printf("%d\n", points);
    return 0;
}