#include <iostream>
#include <vector>
#include <algorithm>
using namespace std;

int N, parent[50];
vector<int> children[50];

int dfs(int p) {
    int result = 0;
    vector<int> tmp;
    for (auto c: children[p]) tmp.push_back(dfs(c));
    sort(tmp.begin(), tmp.end(), greater<int>());  
    for (int i=0; i<tmp.size(); i++) result = max(result, tmp[i] + i+1);
    return result;
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        int p;
        scanf("%d", &p);
        parent[i] = p;
        if (p>=0) children[p].push_back(i);
    }
    printf("%d\n", dfs(0));
    return 0;
}