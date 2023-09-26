#include <iostream>
#include <vector>
#include <map>
#include <utility>
using namespace std;

struct Fireball {
    int m, s, d;
};

int N, M, K, cnt = 0;
int dir[8][2] = {{-1, 0}, {-1, 1}, {0, 1}, {1, 1}, {1, 0}, {1, -1}, {0, -1}, {-1, -1}};
map<pair<int, int>, vector<Fireball> > init;
map<pair<int, int>, vector<Fireball> > &fireballs = init;

int main(void) {
    scanf("%d %d %d", &N, &M, &K);
    for (int i=0; i<M; i++) {
        int r, c, m, s, d;
        scanf("%d %d %d %d %d", &r, &c, &m, &s, &d);
        Fireball fireball = {m , s, d};
        init[make_pair(r, c)].push_back(fireball);
    }
    for (int i=0; i<K; i++) {
        map<pair<int, int>, vector<Fireball> > newFireballs;
        for (auto e: fireballs) {
            int row = e.first.first;
            int col = e.first.second;
            for (auto ball: e.second) {
                int d = ball.d;
                int s = ball.s;
                int newr = (row + dir[d][0] * s + 1000 * N) % N;
                int newc = (col + dir[d][1] * s + 1000 * N) % N;
                newFireballs[make_pair(newr, newc)].push_back({ball.m, s, d});
            }
        }
        vector<pair<int, int> > ballsToErase;
        for (auto &e: newFireballs) {
            if (e.second.size() < 2) continue;
            int newM = 0, newS = 0;
            bool isAllSame = true;
            for (int i=0; i<e.second.size(); i++) {
                newM += e.second[i].m;
                newS += e.second[i].s;
                if (i > 0 && isAllSame) {
                    bool current = e.second[i].d % 2 == 1;
                    bool previous = e.second[i-1].d %2 == 1;
                    if (current != previous) isAllSame = false;
                }
            }
            newM = newM / 5;
            newS = newS / e.second.size();
            if (newM == 0) {
                ballsToErase.push_back(e.first);
                continue;
            }
            vector<Fireball> v;
            for (int i=0; i<4; i++) {
                int newD = isAllSame ? 2 * i : 2 * i + 1;
                v.push_back({newM, newS, newD});
            }
            newFireballs[e.first] = v;
        }
        for (auto p: ballsToErase) newFireballs.erase(p);
        fireballs = newFireballs;
    }

    int answer = 0;
    for (auto e: fireballs) {
        for (auto ball: e.second) answer += ball.m;
    }
    printf("%d\n", answer);
    return 0;
}