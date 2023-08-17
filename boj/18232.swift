class Node<T> {
    let data: T
    var link: Node?

    init(data: T) {
        self.data = data
    }
}

class Queue<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    func push(_ data: T) {
        let node = Node(data: data)
        tail?.link = node
        tail = node
        if head == nil { head = node }
    }

    func pop() -> T? {
        let node = head
        if tail === head { tail = nil }
        head = head?.link
        return node?.data
    }
}

var input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var adj = [Set<Int>](repeating: Set<Int>(), count: n + 1)
var v = [Int](repeating: -1, count: n + 1)
input = readLine()!.split(separator: " ").map { Int($0)! }
let s = input[0]
let e = input[1]
for _ in 0..<m {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].insert(input[1])
    adj[input[1]].insert(input[0])
}

let q = Queue<Int>()
v[s] = 0
q.push(s)
while !q.isEmpty {
    let x = q.pop()!
    if x == e { break }
    var candidates = adj[x]
    candidates.insert(x - 1)
    candidates.insert(x + 1)
    for y in candidates {
        if y < 1 || y > n { continue }
        if v[y] >= 0 { continue }
        v[y] = v[x] + 1
        q.push(y)
    }
}
print(v[e])