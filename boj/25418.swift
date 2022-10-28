import Foundation

struct Queue<T> {
    class Node {
        var data: T
        var link: Node?

        init(data: T) {
            self.data = data
        }
    }

    private var head: Node?
    private var tail: Node?

    var isEmpty: Bool {
        return head == nil
    }

    var front: T {
        return head!.data
    }

    mutating func push(_ data: T) {
        let temp = Node(data: data)
        tail?.link = temp
        tail = temp
        if isEmpty { head = temp }
    }

    mutating func pop() {
        if head === tail { tail = nil }
        head = head?.link
    }
}

func bfs(_ a: Int, _ k: Int) -> Int {
    var v = [Int: Int]()
    var q = Queue<Int>()
    v[a] = 0
    q.push(a)
    while !q.isEmpty {
        let num = q.front
        q.pop()
        if num == k {
            return v[k]!
        }
        var newNum = num + 1
        if newNum <= 1000000 && !v.keys.contains(newNum) {
            v[newNum] = v[num]! + 1
            q.push(newNum)
        }
        newNum = 2 * num
        if newNum <= 1000000 && !v.keys.contains(newNum) {
            v[newNum] = v[num]! + 1
            q.push(newNum)
        }
    }
    return -1
}

let s = readLine()!.split(separator: " ").map { Int($0)! }
let a = s[0]
let k = s[1]
print(bfs(a, k))
