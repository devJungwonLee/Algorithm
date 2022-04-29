#include <iostream>
using namespace std;

int board[19][19], answernum = 0, answerd, answerrow, answercol;
int dir[4][2] = {{0,1}, {1,1}, {1,0}, {1,-1}};

int main(void) {
    bool flag1;
    for (int i=0; i<19; i++) {
        for (int j=0; j<19; j++) {
            scanf("%d", &board[i][j]);
        }
    }
    for (int i=0; i<19; i++) {
        for (int j=0; j<19; j++) {
            if (board[i][j]==0) continue;
            int num = board[i][j];
            flag1 = false;
            for (int d=0; d<4; d++) {
                int newi = i - dir[d][0];
                int newj = j - dir[d][1];
                bool flag2 = true;

                if (newi>=0 && newi<19 && newj>=0 && newj<19 && board[newi][newj] == num) {
                    flag2 = false;
                    continue;
                }
                newi = i;
                newj = j;

                for (int k=0; k<4; k++) {
                    newi = newi + dir[d][0];
                    newj = newj + dir[d][1];
                    if (newi<0 || newi>=19 || newj<0 || newj>=19 || board[newi][newj] != num) {
                        flag2 = false;
                        break;
                    }
                }
                newi = newi + dir[d][0];
                newj = newj + dir[d][1];
                if (newi>=0 && newi<19 && newj>=0 && newj<19 && board[newi][newj] == num) flag2 = false;
                if (flag2) {
                    answerd = d;
                    flag1 = true;
                    break;
                }
            }
            if (flag1) {
                answernum = num;
                if (answerd == 3) {
                    answerrow = i + 4;
                    answercol = j - 4;
                } else {
                    answerrow = i;
                    answercol = j;
                }
                break;
            }
        }
        if (flag1) break;
    }
    printf("%d\n", answernum);
    if (answernum>0) printf("%d %d\n", answerrow+1, answercol+1);
    return 0;
}