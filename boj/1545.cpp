#include <iostream>
#include <algorithm>
using namespace std;

int main(void) {
    string s;
    cin >> s;
    int n = s.size();
    sort(s.begin(), s.end());
    for (int i=(n+1)/2; i<n; i++) {
        if (s[i]!=s[n-1-i]) continue;
        int j = i+1;
        while (j<n && s[j]==s[i]) j++;
        if (j==n) {
            printf("-1\n");
            return 0;
        }
        char c = s[i];
        s[i] = s[j];
        s[j] = c;
    }
    cout << s << endl;
    return 0;
}