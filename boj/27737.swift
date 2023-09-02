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
let k = input[2]
var a = [[Int]]()
var v = [[Bool]](repeating: [Bool](repeating: false, count: n), count: n)
var dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
var count = 0

func bfs(_ start: [Int]) -> Int {
    let q = Queue<[Int]>()
    var result = 0
    v[start[0]][start[1]] = true
    q.push(start)
    while !q.isEmpty {
        let x = q.pop()!
        result += 1
        for d in dir {
            let newr = x[0] + d[0]
            let newc = x[1] + d[1]
            guard 0..<n ~= newr, 0..<n ~= newc else { continue }
            if a[newr][newc] == 1 || v[newr][newc] { continue }
            v[newr][newc] = true
            q.push([newr, newc])
        }
    }
    return result
}

for _ in 0..<n {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}

for i in 0..<n {
    for j in 0..<n {
        if a[i][j] == 1 || v[i][j] { continue }
        let result = bfs([i, j])
        count += result / k + (result % k == 0 ? 0 : 1)
    }
}

if m - count >= 0, count > 0 {
    print("POSSIBLE")
    print(m - count)
} else { 
    print("IMPOSSIBLE")
}