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

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var adj = [[Int]](repeating: [], count: n + 1)
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(input[1])
}

let q = Queue<Int>()
var v = [Int: Int]()
v[1] = 0
q.push(1)
while !q.isEmpty {
    let x = q.pop()!
    for y in adj[x] {
        if v[y] != nil { continue }
        v[y] = v[x]! + 1
        q.push(y)
    }
}
if let answer = v[n] { print(answer) }
else { print("-1") }