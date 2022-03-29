#include <string>
#include <vector>
#include <queue>
#include <cstdlib>
#include <map>
#include <queue>
#include <iostream>
using namespace std;

struct cmp {
    bool operator()(vector<int> &a, vector<int> &b) {
        return a[2] > b[2];
    }
};

int n, num = 0, area[300][300], *parent;
int dir[4][2] = {{-1,0},{0,1},{1,0},{0,-1}};
map<pair<int, int>, int> edgeMap;
priority_queue<vector<int>, vector<vector<int>>, cmp> pq;

void bfs(pair<int, int> start, vector<vector<int>> &land, int height) {
    queue<pair<int, int>> q;

    area[start.first][start.second] = num;
    q.push(start);
    while (!q.empty()) {
        int row = q.front().first;
        int col = q.front().second;
        q.pop();
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr<0 || newr>=n || newc<0 || newc>=n) continue;
            if (area[newr][newc]>0) continue;
            int diff = abs(land[newr][newc]-land[row][col]);
            if (diff > height) continue;
            area[newr][newc] = num;
            q.push(make_pair(newr, newc));
        }
    }
}

int find(int x) {
    if (parent[x] == x) return x;
    int p = find(parent[x]);
    return p;
}

void unionParent(int x, int y) {
    int parentX = find(x);
    int parentY = find(y);
    if (parentX < parentY) parent[parentY] = parentX;
    else parent[parentX] = parentY;
}

int solution(vector<vector<int>> land, int height) {
    n = land.size();

    for (int i=0; i<n; i++) {
        for (int j=0; j<n; j++) {
            if (area[i][j] > 0) continue;
            num++;
            bfs(make_pair(i, j), land, height);
        }
    }

    for (int row=0; row<n; row++) {
        for (int col=0; col<n; col++) {
            for (int i=0; i<4; i++) {
                int newr = row + dir[i][0];
                int newc = col + dir[i][1];
                if (newr<0 || newr>=n || newc<0 || newc>=n) continue;
                if(area[row][col] == area[newr][newc]) continue;
                int area1 = min(area[row][col], area[newr][newc]);
                int area2 = max(area[row][col], area[newr][newc]);
                int diff = abs(land[row][col]-land[newr][newc]);
                pair<int, int> p = make_pair(area1, area2);
                if (edgeMap.find(p) == edgeMap.end()) edgeMap[p] = diff;
                else edgeMap[p] = min(edgeMap[p], diff);
            }
        }
    }

    for (auto edge: edgeMap) {
        vector<int> tmp;
        tmp.push_back(edge.first.first);
        tmp.push_back(edge.first.second);
        tmp.push_back(edge.second);
        pq.push(tmp);
    }

    int answer = 0;
    parent = new int[num+1];
    for (int i=1; i<=num; i++) parent[i] = i;

    while (!pq.empty()) {
        vector<int> top = pq.top();
        pq.pop();
        int x = top[0];
        int y = top[1];
        if (find(x) != find(y)) {
            unionParent(x, y);
            answer += top[2];
        }
    }
    return answer;
}