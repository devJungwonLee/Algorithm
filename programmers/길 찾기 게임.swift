import Foundation

class Node {
    var left: Node?
    let num: Int
    var right: Node?
    
    init(num: Int) {
        self.num = num
    }
}

var root: Node?
var pre = [Int]()
var post = [Int]()

func insert(_ pos: [Int], _ num: Int, _ nodeinfo: [[Int]]) {
    if root == nil {
        root = Node(num: num)
        return
    }
    var p = root!
    while true {
        if nodeinfo[num][0] < nodeinfo[p.num][0] { 
            if p.left == nil { 
                p.left = Node(num: num)
                return
            }
            else { p = p.left! }
        } else { 
            if p.right == nil { 
                p.right = Node(num: num)
                return
            }
            else { p = p.right! }
        }
    }
}

func prefix(_ p: Node?) {
    if p == nil { return }
    pre.append(p!.num + 1)
    prefix(p?.left)
    prefix(p?.right)
}

func postfix(_ p: Node?) {
    if p == nil { return }
    postfix(p?.left)
    postfix(p?.right)
    post.append(p!.num + 1)
}

func solution(_ nodeinfo:[[Int]]) -> [[Int]] {
    var a = [Int](0..<nodeinfo.count).sorted { nodeinfo[$0][1] > nodeinfo[$1][1] }
    for num in a { insert(nodeinfo[num], num, nodeinfo) }
    prefix(root)
    postfix(root)
    return [pre, post]
}