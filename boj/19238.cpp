#include <iostream>
#include <utility>
#include <map>
#include <queue>
using namespace std;

int N, M, fuel;
int a[20][20], v[20][20], dir[4][2] = {{-1, 0}, {0, 1}, {1, 0}, {0, -1}};
bool success = true;
pair<int, int> taxi;
map<pair<int, int>, pair<int, int> > dest;

int distance(pair<int, int> d) {
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) v[i][j] = -1;
    }
    queue<pair<int, int> > q;
    v[taxi.first][taxi.second] = 0;
    q.push(taxi);
    while (!q.empty()) {
        pair<int, int> x = q.front();
        int row = x.first;
        int col = x.second;
        q.pop();
        if (x == d) return v[row][col];
        for (int i=0; i<4; i++) {
            int newr = row + dir[i][0];
            int newc = col + dir[i][1];
            if (newr < 0 || newr >= N || newc < 0 || newc >= N) continue;
            if (a[newr][newc] == 1 || v[newr][newc] >= 0) continue;
            v[newr][newc] = v[row][col] + 1;
            q.push(make_pair(newr, newc));
        }
    }
    return -1;
}

int main(void) {
    scanf("%d %d %d", &N, &M, &fuel);
    for (int i=0; i<N; i++) {
        for (int j=0; j<N; j++) {
            scanf("%d", &a[i][j]);
        }
    }
    scanf("%d %d", &taxi.first, &taxi.second);
    taxi.first--;
    taxi.second--;
    for (int i=0; i<M; i++) {
        int r1, c1, r2, c2;
        scanf("%d %d %d %d", &r1, &c1, &r2, &c2);
        dest[make_pair(r1-1, c1-1)] = make_pair(r2-1, c2-1);
    }

    while (!dest.empty()) {
        int minValue = 99999999;
        pair<int, int> customer;
        for (auto e: dest) {
            pair<int, int> c = e.first;
            int dist = distance(c);
            if (dist > minValue) continue;
            if (dist == minValue && c.first > customer.first) continue;
            if (dist == minValue && c.first == customer.first && c.second > customer.second) continue;
            minValue = dist;
            customer = c;
        }
        if (minValue == -1 || fuel < minValue) {
            success = false;
            break;
        }
        fuel -= minValue;
        taxi = customer;
        int dist = distance(dest[customer]);
        if (dist == -1 || fuel < dist) {
            success = false;
            break;
        }
        fuel -= dist;
        fuel += 2 * dist;
        taxi = dest[customer];
        dest.erase(customer);
    }

    success ? printf("%d\n", fuel) : printf("-1\n");
    return 0;
}