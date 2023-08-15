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
let a = readLine()!.split(separator: " ").map { Int($0)! }
let start = Int(readLine()!)!
let q = Queue<Int>()
var v = Set<Int>()
var answer = 0

answer += 1
v.insert(start)
q.push(start)
while !q.isEmpty {
    let x = q.pop()!
    var y = x + a[x - 1]
    if (1...n) ~= y, !v.contains(y) {
        answer += 1
        v.insert(y)
        q.push(y)
    }
    y = x - a[x - 1]
    if (1...n) ~= y, !v.contains(y) {
        answer += 1
        v.insert(y)
        q.push(y)
    } 
}
print(answer)