#include <iostream>
#include <map>
using namespace std;

int main(void) {
    int wsize, ssize, answer = 0;
    map<char, int> wmap, smap;
    cin >> wsize >> ssize;
    string w, s;
    cin >> w;
    cin >> s;
    for (auto c: w) wmap[c]++;
    for (int i=0; i<ssize; i++) {
        if (i-wsize>=0) {
            smap[s[i-wsize]]--;
            if (smap[s[i-wsize]]==0) smap.erase(s[i-wsize]);
        }
        smap[s[i]]++;
        if (i>=wsize-1 && wmap==smap) answer++;
    }
    cout << answer << endl;
    return 0;
}