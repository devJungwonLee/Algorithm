class Node {
    let data: Int
    var link: Node?

    init(data: Int) {
        self.data = data
    }
}

class Queue {
    var head: Node?
    var tail: Node?

    var isEmpty: Bool {
        return head == nil
    }

    func push(_ data: Int) {
        let temp = Node(data: data)
        tail?.link = temp
        tail = temp
        if head == nil { head = temp }
    }

    func pop() -> Int? {
        let data = head?.data
        if head?.link == nil { tail = nil }
        head = head?.link
        return data
    }
}

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var adj = [[Int]](repeating: [Int](), count: n + 1)
var d = [Int](repeating: Int.max - 1, count: n + 1)
let queue = Queue()
for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(input[1])
    adj[input[1]].append(input[0])
}

func bfs(_ start: Int) {
    d[start] = 0
    queue.push(start)
    while !queue.isEmpty {
        let x = queue.pop()!
        for y in adj[x] {
            if d[x] + 1 > d[y] { continue }
            d[y] = d[x] + 1
            queue.push(y)
        }
    }
}

bfs(1)

let q = Int(readLine()!)!
for _ in 0..<q {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(input[1])
    adj[input[1]].append(input[0])
    bfs(1)
    print(Array(d[1...n]).map { $0 == Int.max - 1 ? "-1" : String($0) }.joined(separator: " "))
}