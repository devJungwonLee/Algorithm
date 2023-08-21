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

let n = Int(readLine()!)!
var adj = [[[Int]]](repeating: [], count: n + 1)
var d = [Int64](repeating: -1, count: n + 1)
for _ in 0..<(n - 1) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append([input[1], input[2]])
    adj[input[1]].append([input[0], input[2]])
}

let q = Queue<Int>()
d[1] = 0
q.push(1)
while !q.isEmpty {
    let x = q.pop()!
    for y in adj[x] {
        if d[y[0]] >= 0 { continue }
        d[y[0]] = d[x] + Int64(y[1])
        q.push(y[0])
    }
}
print(d.max()!)