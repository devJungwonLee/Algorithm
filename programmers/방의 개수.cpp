#include <string>
#include <vector>
#include <set>
#include <utility>
#include <iostream>
#include <algorithm>
using namespace std;

set<pair<int, int>> v;
set<vector<pair<int, int>>> e;

vector<pair<int, int>> makeEdge(pair<int, int> p1, pair<int, int> p2) {
    vector<pair<int, int>> edge;
    edge.push_back(p1);
    edge.push_back(p2);
    sort(edge.begin(), edge.end());
    return edge;
}

int solution(vector<int> arrows) {
    int answer = 0, row = 0, col = 0, newr, newc;
    int dir[8][2] = {{-1,0},{-1,1},{0,1},{1,1},{1,0},{1,-1},{0,-1},{-1,-1}};
    
    v.insert(make_pair(row, col));
    for (auto arrow: arrows) {
        for (int i=0; i<2; i++) {
            newr = row + dir[arrow][0];
            newc = col + dir[arrow][1];
            vector<pair<int, int>> edge = makeEdge(make_pair(row, col), make_pair(newr, newc));
            e.insert(edge);
            v.insert(make_pair(newr, newc));
            row = newr;
            col = newc;    
        }
    }
    answer = 1 - v.size() + e.size();
    return answer;
}