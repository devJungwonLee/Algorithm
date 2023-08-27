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
var adj = [[Int]](repeating: [], count: 26)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ")
    let from = Int(input[0].first!.asciiValue!) - 97
    let to = Int(input[2].first!.asciiValue!) - 97
    adj[from].append(to)
}

func check(_ start: Int, _ end: Int) -> Bool {
    let q = Queue<Int>()
    var v = [Bool](repeating: false, count: 26)
    v[start] = true
    q.push(start)
    while !q.isEmpty {
        let x = q.pop()!
        if x == end { return true }
        for y in adj[x] {
            if v[y] { continue }
            v[y] = true
            q.push(y)
        }
    }
    return false
}

let m = Int(readLine()!)!
for _ in 0..<m {
    let input = readLine()!.split(separator: " ")
    let from = Int(input[0].first!.asciiValue!) - 97
    let to = Int(input[2].first!.asciiValue!) - 97
    let result = check(from, to)
    result ? print("T") : print("F")
}