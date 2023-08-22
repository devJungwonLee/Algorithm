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

var a = [[Int]]()
var end = [Int]()
var v = [[Int]](repeating: [Int](repeating: -1, count: 5), count: 5)
for i in 0..<5 {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
    for j in 0..<5 {
        if a[i][j] == 1 { end = [i, j] }
    }
}
let start = readLine()!.split(separator: " ").map { Int($0)! }
let q = Queue<[Int]>()
var dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
v[start[0]][start[1]] = 0
q.push(start)
while !q.isEmpty {
    let x = q.pop()!
    if x == end { break }
    let row = x[0]
    let col = x[1]
    for d in dir {
        let newr = row + d[0]
        let newc = col + d[1]
        if newr < 0 || newr >= 5 || newc < 0 || newc >= 5 { continue }
        if a[newr][newc] == -1 || v[newr][newc] >= 0 { continue }
        v[newr][newc] = v[row][col] + 1
        q.push([newr, newc])
    }
}
print(v[end[0]][end[1]])