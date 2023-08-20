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
let r = input[2]
var adj = [[Int]](repeating: [], count: n + 1)
var t = [Int](repeating: 0, count: n + 1)
var d = [Int](repeating: -1, count: n + 1)
var order = 1

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(input[1])
    adj[input[1]].append(input[0])
}
for i in 1...n { adj[i].sort() }

t[r] = order
d[r] = 0
let q = Queue<Int>()
q.push(r)

while !q.isEmpty {
    let x = q.pop()!
    for y in adj[x] {
        if d[y] >= 0 { continue }
        d[y] = d[x] + 1
        order += 1
        t[y] = order
        q.push(y)
    }
}
let answer = (1...n).reduce(0) { $0 + Int64(d[$1]) * Int64(t[$1]) }
print(answer)