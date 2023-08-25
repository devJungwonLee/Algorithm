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
var a = [[Int]]()
for _ in 0..<n {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let q = Queue<[Int]>()
var v = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var dir = [[0, 1], [1, 0]]
v[0][0] = true
q.push([0, 0])
while !q.isEmpty {
    let x = q.pop()!
    let row = x[0]
    let col = x[1]
    if a[row][col] == -1 { break }
    for d in dir {
        let newr = row + d[0] * a[row][col]
        let newc = col + d[1] * a[row][col]
        if newr < 0 || newr >= n || newc < 0 || newc >= n { continue }
        if v[newr][newc] { continue }
        v[newr][newc] = true
        q.push([newr, newc])
    }
}

if v[n-1][n-1] {
    print("HaruHaru")
} else {
    print("Hing")
}