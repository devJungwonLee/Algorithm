#include <iostream>
#include <queue>
using namespace std;

int T, n;

void print(queue<int> preorder, queue<int> inorder) {
    if (preorder.empty()) return;
    if (preorder.size()==1) {
        printf("%d ", preorder.front());
        return;
    }
    int num = preorder.front();
    preorder.pop();
    queue<int> preLeft, inLeft;
    while (!inorder.empty() && inorder.front()!=num) {
        inLeft.push(inorder.front());
        inorder.pop();
    }
    for (int i=0; i<inLeft.size(); i++) {
        preLeft.push(preorder.front());
        preorder.pop();
    }
    if (!inorder.empty()) inorder.pop();
    print(preLeft, inLeft);
    print(preorder, inorder);
    printf("%d ", num);
}

int main(void) {
    scanf("%d", &T);
    for (int t=0; t<T; t++) {
        queue<int> preorder, inorder;
        int num;
        scanf("%d", &n);
        for (int i=0; i<n; i++) {
            scanf("%d", &num);
            preorder.push(num);
        }
        for (int i=0; i<n; i++) {
            scanf("%d", &num);
            inorder.push(num);
        }
        print(preorder, inorder);
        printf("\n");
    }
    return 0;
}