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
let numbers = readLine()!.split(separator: " ").map { Int($0)! }
let input = readLine()!.split(separator: " ").map { Int($0)! }
let a = input[0]
let b = input[1]

let q = Queue<Int>()
var v = [Int](repeating: -1, count: n + 1)
v[a] = 0
q.push(a)
while !q.isEmpty {
    let x = q.pop()!
    if x == b { break }
    var c = numbers[x-1]
    while c <= n {
        var y = x + c
        if (1...n) ~= y && (v[y] == -1 || v[x] + 1 < v[y]) {
            v[y] = v[x] + 1
            q.push(y)
        }
        y = x - c
        if (1...n) ~= y && (v[y] == -1 || v[x] + 1 < v[y]) {
            v[y] = v[x] + 1
            q.push(y)
        }
        c += numbers[x-1]
    }
}
print(v[b])