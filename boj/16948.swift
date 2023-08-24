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
let input = readLine()!.split(separator: " ").map { Int($0)! }
let start = [input[0], input[1]]
let end = [input[2], input[3]]
let q = Queue<[Int]>()
var v = [[Int]: Int]()
var dir = [[-2, -1], [-2, 1], [0, -2], [0, 2], [2, -1], [2, 1]]
v[start] = 0
q.push(start)
while !q.isEmpty {
    let x = q.pop()!
    if x == end { break }
    let row = x[0]
    let col = x[1]
    for d in dir {
        let newr = row + d[0]
        let newc = col + d[1]
        if newr < 0 || newr >= n || newc < 0 || newc >= n { continue }
        let next = [newr, newc]
        if v.keys.contains(next) { continue }
        v[next] = v[x]! + 1
        q.push(next)
    }
}
if let x = v[end] { print(x) }
else { print("-1") }