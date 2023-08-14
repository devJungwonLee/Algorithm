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
let a = input[0]
let b = input[1]
input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var adj = [[Int]](repeating: [], count: n + 1)
var d = [Int](repeating: -1, count: n + 1)
for _ in 0..<m {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(input[1])
    adj[input[1]].append(input[0])
}

let q = Queue<Int>()
d[a] = 0
q.push(a)
while !q.isEmpty {
    let x = q.pop()!
    if x == b { break }
    for y in adj[x] {
        if d[y] >= 0 { continue }
        d[y] = d[x] + 1
        q.push(y)
    }
}
print(d[b])