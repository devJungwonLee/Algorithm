#include <iostream>
#include <queue>
#include <map>
using namespace std;

int T, k, num;
char c;
priority_queue<int> maxHeap;
priority_queue<int, vector<int>, greater<int> > minHeap;
map<int, int> cnt;

int main(void) {
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        scanf("%d", &k);
        for (int i=0; i<k; i++) {
            getchar();
            scanf("%c %d", &c, &num);
            if (c=='I') {
                maxHeap.push(num);
                minHeap.push(num);
                cnt[num]++;
            } else {
                if (num==1) {
                    while (!maxHeap.empty() && cnt[maxHeap.top()] == 0) maxHeap.pop();
                    if (!maxHeap.empty()) {
                        cnt[maxHeap.top()]--;
                        maxHeap.pop();
                    }
                } else {
                    while (!minHeap.empty() && cnt[minHeap.top()] == 0) minHeap.pop();
                    if (!minHeap.empty()) {
                        cnt[minHeap.top()]--;
                        minHeap.pop();
                    }
                }
            }
        }
        while (!maxHeap.empty() && cnt[maxHeap.top()] == 0) maxHeap.pop();
        while (!minHeap.empty() && cnt[minHeap.top()] == 0) minHeap.pop();
        if (maxHeap.empty()) printf("EMPTY\n");
        else printf("%d %d\n", maxHeap.top(), minHeap.top());
    }
    return 0;
}