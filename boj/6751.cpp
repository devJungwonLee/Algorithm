#include <iostream>
#include <set>
using namespace std;

int findNextYear(int year) {
    for (int y=year+1; ; y++) {
        set<int> myset;
        int tmp = y;
        bool success = true;
        while (tmp>0) {
            int r = tmp % 10;
            if (myset.find(r) != myset.end()) {
                success = false;
                break;
            }
            myset.insert(r);
            tmp /= 10;
        }
        if (success) return y;
    }
}

int main(void) {
    int year;
    cin >> year;
    cout << findNextYear(year) << endl;
    return 0;
}