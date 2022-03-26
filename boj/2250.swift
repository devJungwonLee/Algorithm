import Foundation

var n = 0
var tree = [[Int]]()
var root = 0
var range = [[Int]]()
var order = 1

func inorder(_ num: Int, _ depth: Int) {
    if range.count == depth { range.append([]) }
    let lchild = tree[num][0]
    let rchild = tree[num][1]
    if lchild != -1 { inorder(lchild, depth + 1) }
    if range[depth].isEmpty { 
        range[depth].append(order)
        range[depth].append(order)
    }
    else { range[depth][1] = max(range[depth][1], order) }
    order += 1
    if rchild != -1 { inorder(rchild, depth + 1) }
}

n = Int(readLine()!)!
root = n * (n + 1) / 2
tree = [[Int]](repeating: [], count: n + 1)

for _ in 0..<n {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    tree[input[0]] = [input[1], input[2]]
    if input[1] != -1 { root -= input[1] }
    if input[2] != -1 { root -= input[2] }
}

inorder(root, 0)
var level = 0
for i in 1..<range.count {
    if range[i][1] - range[i][0] > range[level][1] - range[level][0] {
        level = i
    }
}
print(level+1, range[level][1] - range[level][0] + 1)