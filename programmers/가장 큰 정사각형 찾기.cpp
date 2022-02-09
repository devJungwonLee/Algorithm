#include <iostream>
#include<vector>
#include <algorithm>
using namespace std;

int d[1000][1000];

int solution(vector<vector<int>> board) {
    int answer = 0;
    for (int i=0; i<board.size(); i++) {
        for (int j=0; j<board[i].size(); j++) {
            if (board[i][j]==0) d[i][j]=0;
            else {
                int a = i>0&&j>0 ? d[i-1][j-1] : 0;
                int b = i>0 ? d[i-1][j] : 0;
                int c = j>0 ? d[i][j-1] : 0;
                d[i][j] = min(min(a, b), c) + 1;
                answer = max(answer, d[i][j]);
            }
        }
    }
    answer = answer * answer;
    return answer;
}