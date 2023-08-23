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
let k = input[1]
var adj = [[Int]](repeating: [], count: n)
var v = [Int](repeating: -1, count: n)
for _ in 0..<(n - 1) {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    adj[input[0]].append(input[1])
}
let a = readLine()!.split(separator: " ").map { Int($0)! }
let q = Queue<Int>()
var answer = 0
v[0] = 0
q.push(0)
while !q.isEmpty { 
    let x = q.pop()!
    if a[x] == 1 { answer += 1 }
    if v[x] == k { continue }
    for y in adj[x] {
        v[y] = v[x] + 1
        q.push(y)
    }
}
print(answer)