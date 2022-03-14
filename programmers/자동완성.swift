import Foundation

class Node {
    var c: String
    var children = [Node?](repeating: nil, count: 26)
    var cnt = 1
    var isEnd = false
    
    init(c: String) { self.c = c }
}

var root = Node(c: "")
var answer = 0

func makeTree(_ node: Node, _ word: [String], _ depth: Int) {
    let c = word[depth]
    let idx = Int(c.unicodeScalars.first!.value - 97)
    if let child = node.children[idx] {
        child.cnt += 1
    } else { node.children[idx] = Node(c: c) }
    if depth == word.count - 1 { node.children[idx]!.isEnd = true }
    else { makeTree(node.children[idx]!, word, depth + 1) }
}

func findAnswer(_ node: Node, _ depth: Int) {
    if node.cnt == 1 { answer += depth }
    else { 
        if node.isEnd { answer += depth }
        for child in node.children {
            if let child = child { findAnswer(child, depth + 1) }
        }
    }
}

func solution(_ words:[String]) -> Int {
    root.cnt = words.count
    let words = words.map { $0.map { String($0) } }
    for word in words { makeTree(root, word, 0) }
    findAnswer(root, 0)
    return answer
}