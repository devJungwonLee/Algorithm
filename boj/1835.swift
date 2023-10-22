class Node<T> {
    let data: T
    var front: Node<T>?
    var back: Node<T>?

    init(_ data: T) {
        self.data = data
    }
}

class Deque<T> {
    var head: Node<T>?
    var tail: Node<T>?

    var isEmpty: Bool {
        return head == nil
    }

    var front: T? {
        return head?.data
    }

    var back: T? {
        return tail?.data
    }

    func pushBack(_ data: T) {
        let node = Node(data)
        tail?.back = node
        node.front = tail
        tail = node
        if head == nil { head = node }
    }

    func pushFront(_ data: T) {
        let node = Node(data)
        head?.front = node
        node.back = head
        head = node
        if tail == nil { tail = node }
    }

    func popBack() {
        tail = tail?.front
        tail?.back = nil
        if tail == nil { head = nil }
    }

    func popFront() {
        head = head?.back
        head?.front = nil
        if head == nil { tail = nil }
    }
}

let deque = Deque<Int>()
let num = Int(readLine()!)!

var i = num
while i > 0 {
    deque.pushFront(i)
    for _ in 0..<i {
        if let back = deque.back {
            deque.popBack()
            deque.pushFront(back)
        }
    }
    i -= 1
}

while !deque.isEmpty {
    if let front = deque.front {
        print(front, terminator: " ")
        deque.popFront()
    }
}
print("")