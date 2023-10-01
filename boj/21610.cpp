#include <iostream>
#include <utility>
#include <vector>
#include <set>
using namespace std;

int N, M, a[50][50];
int dir[8][2] = {{0, -1}, {-1, -1}, {-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}, {1, -1}};
vector<pair<int, int> > clouds;

void move(int d, int s) {
    for (auto &cloud: clouds) {
        int newr = cloud.first + dir[d][0] * s;
        while (newr < 0) newr += N;
        newr = newr % N;
        int newc = cloud.second + dir[d][1] * s;
        while (newc < 0) newc += N;
        newc = newc % N;
        cloud.first = newr;
        cloud.second = newc;
        a[newr][newc]++;
    }
}

void copy() {
    int diagonal[4][2] = {{-1, -1}, {-1, 1}, {1, 1}, {1, -1}};
    for (auto cloud: clouds) {
        int count = 0;
        for (int i=0; i<4; i++) {
            int newr = cloud.first + diagonal[i][0];
            int newc = cloud.second + diagonal[i][1];
            if (newr < 0 || newr >= N || newc < 0 || newc >= N) continue;
            if (a[newr][newc] > 0) count++;
        }
        a[cloud.first][cloud.second] += count;
    }
}

void makeClouds() {
    set<pair<int, int> > cloudSet;
    for (auto cloud: clouds) cloudSet.insert(cloud);
    clouds.clear();
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            if (a[i][j] >= 2 && cloudSet.find(make_pair(i, j)) == cloudSet.end()) {
                clouds.push_back(make_pair(i, j));
                a[i][j] -= 2;
            }
        }
    }
}

int main(void) {
    scanf("%d %d", &N, &M);
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) scanf("%d", &a[i][j]);
    }

    clouds.push_back(make_pair(N-1, 0));
    clouds.push_back(make_pair(N-1, 1));
    clouds.push_back(make_pair(N-2, 0));
    clouds.push_back(make_pair(N-2, 1));

    for (int i=0; i<M; i++) {
        int d, s;
        scanf("%d %d", &d, &s);
        move(d-1, s);
        copy();
        makeClouds();
    }

    int answer = 0;
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) answer += a[i][j];
    }
    printf("%d\n", answer);
    return 0;
}