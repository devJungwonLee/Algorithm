#include <iostream>
#include <queue>
#include <vector>
#include <set>
using namespace std;

int n, m, adj[201][201];
bool v[201], answer = false;

set<int> bfs(int start) {
    set<int> area;
    queue<int> q;
    v[start] = true;
    q.push(start);
    while (!q.empty()) {
        int num = q.front();
        q.pop();
        area.insert(num);
        for (int i=1; i<=n; i++) {
            if (i==num) continue;
            if (adj[num][i]==0) continue;
            if (v[i]) continue;
            v[i] = true;
            q.push(i);
        } 
    }
    return area;
}

set<int> makeSchedule(char *s) {
    set<int> schedule;
    string tmp = "";
    for (int i=0; s[i]!='\n'; i++) {
        if (s[i]==' ') {
            schedule.insert(stoi(tmp));
            tmp = "";
        } else tmp += s[i];
    }
    schedule.insert(stoi(tmp));
    return schedule;
}

int main(void) {
    char s[10000];
    scanf("%d %d", &n, &m);
    for (int i=1; i<=n; i++) {
        for (int j=1; j<=n; j++) {
            scanf("%d", &adj[i][j]);
        }
    }

    getchar();
    fgets(s, sizeof(s), stdin);
    set<int> schedule = makeSchedule(s);
    
    for (int i=1; i<=n; i++) {
        if (v[i]) continue;
        set<int> area = bfs(i);
        bool canTravel = true;
        for (auto node: schedule) {
            if (area.find(node) == area.end()) {
                canTravel = false;
                break;
            }
        }
        if (canTravel) {
            answer = true;
            break;
        }
    }
    if (answer) printf("YES\n");
    else printf("NO\n");
    return 0;
}