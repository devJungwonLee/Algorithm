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
let s = input[1]
let d = input[2]
let f = input[3]
let b = input[4]
let k = input[5]
var police = Set<Int>()
if k > 0 {
    input = readLine()!.split(separator: " ").map { Int($0)! }
    input.forEach { police.insert($0) }
}
let q = Queue<Int>()
var count = [Int: Int]()
var deltas = [f, -b]
count[s] = 0
q.push(s)
while !q.isEmpty {
    let x = q.pop()!
    if x == d { break }
    for delta in deltas {
        let y = x + delta
        if y < 1 || y > n { continue }
        if police.contains(y) { continue }
        if count[y] != nil { continue }
        count[y] = count[x]! + 1
        q.push(y)
    }
}
if let answer = count[d] {
    print(answer)
} else {
    print("BUG FOUND")
}