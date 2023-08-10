class Node {
    let data: [Int]
    var link: Node?

    init(data: [Int]) {
        self.data = data
    }
}

class Queue {
    var head: Node?
    var tail: Node?

    var isEmpty: Bool {
        return head == nil
    }

    func push(_ data: [Int]) {
        let node = Node(data: data)
        tail?.link = node
        tail = node
        if head == nil { head = node }
    }

    func pop() -> [Int]? {
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
let q = Queue()

func bfs() {
    q.push([0, 0])
    while !q.isEmpty {
        let p = q.pop()!
        let row = p[0]
        let col = p[1]
        let num = a[row][col]
        if num == 0 { continue }
        if num == -1 {
            print("HaruHaru")
            return
        }
        var newr = row
        var newc = col + num
        if newr < n, newc < n {
            q.push([newr, newc])
        }
        newr = row + num
        newc = col
        if newr < n, newc < n {
            q.push([newr, newc])
        }
    }
    print("Hing")
}

bfs()