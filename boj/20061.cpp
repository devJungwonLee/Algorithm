#include <iostream>
using namespace std;

bool blue[4][6], green[6][4];
int N, point = 0;

void moveToBlue(int t, int x, int y) {
    int col = 0;
    while (col < 5 && !blue[x][col+1]) col++;
    if (t == 3) {
        int tempCol = 0;
        while (tempCol < 5 && !blue[x+1][tempCol+1]) tempCol++;
        col = min(col, tempCol);
    }
    blue[x][col] = true;
    if (t == 2) blue[x][col-1] = true;
    if (t == 3) blue[x+1][col] = true;
    for(int k=0; k<2; k++) {
        bool line = true;
        for (int i=0; i<4; i++) line = line && blue[i][col];
        if (!line) {
            if (t!=2 || k==1) break;
            else {
                col--;
                continue;
            }
        }
        point += 1;
        for (int j=col-1; j>=0; j--) {
            for (int i=0; i<4; i++) blue[i][j+1] = blue[i][j];
        }
        for (int i=0; i<4; i++) blue[i][0] = false;
    }
    while (true) {
        bool line = false;
        for(int i=0; i<4; i++) line = line || blue[i][1];
        if (!line) break;
        for (int j=4; j>=0; j--) {
            for (int i=0; i<4; i++) blue[i][j+1] = blue[i][j];
        }
        for (int i=0; i<4; i++) blue[i][0] = false;
    }
}

void moveToGreen(int t, int x, int y) {
    int row = 0;
    while (row < 5 && !green[row+1][y]) row++;
    if (t == 2) {
        int tempRow = 0;
        while (tempRow < 5 && !green[tempRow+1][y+1]) tempRow++;
        row = min(row, tempRow);
    }
    green[row][y] = true;
    if (t == 3) green[row-1][y] = true;
    if (t == 2) green[row][y+1] = true;
    for (int k=0; k<2; k++) {
        bool line = true;
        for (int j=0; j<4; j++) line = line && green[row][j];
        if (!line) {
            if (t!=3 || k==1) break;
            else {
                row--;
                continue;
            }
        }
        point += 1;
        for (int i=row-1; i>=0; i--) {
            for (int j=0; j<4; j++) green[i+1][j] = green[i][j];
        }
        for (int j=0; j<4; j++) green[0][j] = false;
    }
    while (true) {
        bool line = false;
        for(int j=0; j<4; j++) line = line || green[1][j];
        if (!line) break;
        for (int i=4; i>=0; i--) {
            for (int j=0; j<4; j++) green[i+1][j] = green[i][j];
        }
        for (int j=0; j<4; j++) green[0][j] = false;
    }
}

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        int t, x, y;
        scanf("%d %d %d", &t, &x, &y);
        moveToBlue(t, x, y);
        moveToGreen(t, x, y);
    }
    int count = 0;
    for (int i=0; i<4; i++) {
        for (int j=0; j<6; j++) {
            if (blue[i][j]) count++;
        }
    }
    for (int i=0; i<6; i++) {
        for (int j=0; j<4; j++) {
            if (green[i][j]) count++;
        }
    }
    printf("%d\n%d\n", point, count);
    return 0;
}