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
var a = [[[Int]]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let line = (0..<m).map { (index: Int) -> [Int] in
        [input[3 * index], input[3 * index + 1], input[3 * index + 2]]
    }
    a.append(line)
}
let t = Double(readLine()!)!

let b = a.map { line in 
    return line.map { (pixel: [Int]) -> Int in
        let average = Double(pixel[0] + pixel[1] + pixel[2]) / 3.0
        return average >= t ? 1 : 0
    }
}

let q = Queue<[Int]>()
var v = [[Bool]](repeating: [Bool](repeating: false, count: m), count: n)
var answer = 0

func bfs(_ start: [Int]) {
    let dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    v[start[0]][start[1]] = true
    q.push(start)
    while !q.isEmpty {
        let x = q.pop()!
        let row = x[0]
        let col = x[1]
        for d in dir {
            let newr = row + d[0]
            let newc = col + d[1]
            if newr < 0 || newr >= n || newc < 0 || newc >= m { continue }
            if b[newr][newc] == 0 || v[newr][newc] { continue }
            v[newr][newc] = true
            q.push([newr, newc])
        }
    }
}

for i in 0..<n {
    for j in 0..<m {
        if b[i][j] == 0 || v[i][j] { continue }
        bfs([i, j])
        answer += 1
    }
}
print(answer)