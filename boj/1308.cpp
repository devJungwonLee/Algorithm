#include <iostream>
using namespace std;

int ya, yb, ma, mb, da, db;
int dayOfMonth[13] = {0, 31, 28, 31, 30, 31, 30, 31, 31, 30, 31, 30, 31};

bool isGG() {
    if (yb-ya>1000) return true;
    if (yb-ya<1000) return false;
    if (mb>ma) return true;
    if (mb<ma) return false;
    if (db>=da) return true;
    else return false;
}

bool isLeapYear(int y) {
    if (y%4==0) {
        if (y%100==0) {
            if (y%400==0) return true;
            else return false;
        }
        else return true;
    }
    return false;
}

int totalDay(int y, int m, int d) {
    int total = 0;
    total += (y-1) * 365;
    total += (y-1) / 4;
    total -= (y-1) / 100;
    total += (y-1) / 400;
    for (int i=1; i<=m-1; i++) total += dayOfMonth[i];
    if (isLeapYear(y) && m > 2) total++;
    total += d;
    return total;
}

int findDDay() {
    int totalA = totalDay(ya, ma, da);
    int totalB = totalDay(yb, mb, db);
    return totalB - totalA;
}

int main(void) {
    cin >> ya >> ma >> da;
    cin >> yb >> mb >> db;
    if (isGG()) printf("gg\n");
    else printf("D-%d\n", findDDay());
    return 0;
}