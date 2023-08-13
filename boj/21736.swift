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
var a = [[String]]()
var start = [Int]()
for i in 0..<n {
    a.append(readLine()!.map { String($0) })
    if let j = a.last?.firstIndex(where: { $0 == "I" }) {
        start = [i, j]
    }
}

let q = Queue<[Int]>()
var v = Set<[Int]>()
var dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
var cnt = 0
v.insert(start)
q.push(start)
while !q.isEmpty {
    let x = q.pop()!
    let row = x[0]
    let col = x[1]
    for d in dir {
        let newr = row + d[0]
        let newc = col + d[1]
        if newr < 0 || newr >= n || newc < 0 || newc >= m { continue }
        if a[newr][newc] == "X" || v.contains([newr, newc]) { continue }
        if a[newr][newc] == "P" { cnt += 1 }
        v.insert([newr, newc])
        q.push([newr, newc])
    }
}
if cnt > 0 { print(cnt) }
else { print("TT") }