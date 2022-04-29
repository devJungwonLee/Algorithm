#include <iostream>
#include <stack>
using namespace std;

int N, nums[1000000], cnt[1000001], result[1000000];
stack<int> st;

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) {
        scanf("%d", &nums[i]);
        cnt[nums[i]]++;
    }
    for (int i=N-1; i>=0; i--) {
        int num = nums[i];
        int cntNum = cnt[num];
        while (!st.empty()) {
            int top = st.top();
            int cntTop = cnt[top];
            if (cntNum>=cntTop) st.pop();
            else break;
        }
        if (st.empty()) result[i] = -1;
        else result[i] = st.top();
        st.push(num);
    }
    for (int i=0; i<N; i++) printf("%d ", result[i]);
    printf("\n");
    return 0;
}