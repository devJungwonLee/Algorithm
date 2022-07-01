#include <iostream>
#include <vector>
using namespace std;

bool doesExist(vector<int> &v, int num) {
    int left = 0, right = v.size()-1, mid;
    while (left<=right) {
        int mid = (left+right)/2;
        if (v[mid]<num) left = mid+1;
        else if (v[mid]>num) right = mid-1;
        else return true;
    }
    return false;
}

int main(void) {
    int N, M, num, answer;
    while (true) {
        scanf("%d %d", &N, &M);
        if (N==0 && M==0) break;
        vector<int> v;
        answer = 0;
        for (int i=0; i<N; i++) {
            scanf("%d", &num);
            v.push_back(num);
        }
        for (int i=0; i<M; i++) {
            scanf("%d", &num);
            if (doesExist(v, num)) answer++;
        }
        printf("%d\n", answer);
    }
    return 0;
}