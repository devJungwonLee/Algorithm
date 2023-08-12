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
var a = [[Int]]()
let q = Queue<[Int]>()
var v = [[Int]](repeating: [Int](repeating: -1, count: m), count: n)
var dir = [[-1, 0], [-1, 1], [0, 1], [1, 1], [1, 0], [1, -1], [0, -1], [-1, -1]]

for i in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    for j in 0..<m {
        if input[j] == 1 {
            v[i][j] = 0
            q.push([i, j])
        }
    }
}

while !q.isEmpty {
    let x = q.pop()!
    let row = x[0]
    let col = x[1]
    for d in dir {
        let newr = row + d[0]
        let newc = col + d[1]
        if newr < 0 || newr >= n || newc < 0 || newc >= m { continue }
        if v[newr][newc] >= 0 { continue }
        v[newr][newc] = v[row][col] + 1
        q.push([newr, newc])
    }
}
let answer = v.map { $0.max()! }.max()!
print(answer)