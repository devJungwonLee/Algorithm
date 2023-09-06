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

func change(_ a: [Int], _ i: Int) -> [Int] {
    switch i {
    case 0:
        return [a[7], a[6], a[5], a[4], a[3], a[2], a[1], a[0]]
    case 1:
        return [a[3], a[0], a[1], a[2], a[5], a[6], a[7], a[4]]
    case 2:
        return [a[0], a[2], a[5], a[3], a[4], a[6], a[1], a[7]]
    default:
        return [a[4], a[1], a[2], a[3], a[0], a[5], a[6], a[7]]
    }
}

let a = readLine()!.split(separator: " ").map { Int($0)! }
let start = Array(1...8)
let q = Queue<[Int]>()
var d = [[Int]: Int]()
d[start] = 0
q.push(start)
while !q.isEmpty {
    let x = q.pop()!
    if x == a { break }
    for i in 0..<4 {
        let y = change(x, i)
        if d[y] != nil { continue }
        d[y] = d[x]! + 1
        q.push(y)
    }
}
print(d[a]!)