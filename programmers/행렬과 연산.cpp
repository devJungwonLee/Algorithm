#include <string>
#include <vector>
#include <deque>
#include <iostream>
using namespace std;

deque<deque<int>*> rows;
deque<deque<int>> cols;
int r, c;

void shiftRow() {
    rows.push_front(rows.back());
    rows.pop_back();
    cols[0].push_front(cols[0].back());
    cols[0].pop_back();
    cols[1].push_front(cols[1].back());
    cols[1].pop_back();
}

void rotate() {
    if (c==2) {
        cols[1].push_front(cols[0].front());
        cols[0].pop_front();
        cols[0].push_back(cols[1].back());
        cols[1].pop_back();
        return;
    }
    rows[0]->push_front(cols[0].front());
    cols[0].pop_front();
    cols[0].push_back(rows[r-1]->front());
    rows[r-1]->pop_front();
    rows[r-1]->push_back(cols[1].back());
    cols[1].pop_back();
    cols[1].push_front(rows[0]->back());
    rows[0]->pop_back();
}

vector<vector<int>> solution(vector<vector<int>> rc, vector<string> operations) {
    r = rc.size();
    c = rc[0].size();
    cols.assign(2, {});
    cols[0].assign(r, 0);
    cols[1].assign(r, 0);
    
    for (int i=0; i<r; i++) {
        rows.push_back(new deque<int>(c-2));
        for (int j=1; j<c-1; j++) rows[i]->at(j-1) = rc[i][j];
        cols[0][i] = rc[i][0];
        cols[1][i] = rc[i][c-1];
    }

    for (auto operation: operations) {
        if (operation[0] == 'S') shiftRow();
        else rotate();
    }
    
    for (int i=0; i<r; i++) {
        rc[i][0] = cols[0][i];
        rc[i][c-1] = cols[1][i];
        for (int j=0; j<rows[i]->size(); j++) rc[i][j+1] = rows[i]->at(j);
    }
    
    return rc;
}