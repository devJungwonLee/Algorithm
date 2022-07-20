#include <iostream>
#include <stack>
using namespace std;

int N, a[1000000], answer[1000000];
stack<int> st;

int main(void) {
    scanf("%d", &N);
    for (int i=0; i<N; i++) scanf("%d", &a[i]);

    for (int i=0; i<N; i++) {
        while (!st.empty() && a[i] > a[st.top()]) {
            answer[st.top()] = a[i];
            st.pop();
        }
        st.push(i);
    }

    while (!st.empty()) {
        answer[st.top()] = -1;
        st.pop();
    }
    for (int i=0; i<N; i++) printf("%d ", answer[i]);
    printf("\n");
    return 0;
}