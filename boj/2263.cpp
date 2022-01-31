#include <iostream>
#include <vector>
#include <map>
using namespace std;

int n, num;
vector<int> inorder, postorder;
map<int, int> inorderIndex, postorderIndex;

void f(int il, int ir, int pl, int pr) {
    if (il>ir || pl>pr) return;
    int root = postorder[pr];
    printf("%d ", root);
    int rootIndex = inorderIndex[root];
    f(il, rootIndex-1, pl, pl+rootIndex-il-1);
    f(rootIndex+1, ir, pr-ir+rootIndex, pr-1);
}

int main(void) {
    scanf("%d", &n);
    for (int i=0; i<n; i++) {
        scanf("%d", &num);
        inorder.push_back(num);
        inorderIndex[num] = i;
    }
    for (int i=0; i<n; i++) {
        scanf("%d", &num);
        postorder.push_back(num);
        postorderIndex[num] = i;
    }
    f(0, n-1, 0, n-1);
    printf("\n");
    return 0;
}