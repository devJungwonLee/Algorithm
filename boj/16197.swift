import Foundation

struct Queue<Element> {
    class Node<Element> {
        var data: Element
        var link: Node<Element>?

        init(data: Element) {
            self.data = data
        }
    }

    private var head: Node<Element>?
    private var tail: Node<Element>?

    var isEmpty: Bool {
        return head == nil
    }

    var front: Element? {
        return head?.data
    }

    mutating func push(_ data: Element) {
        let temp = Node(data: data)
        if tail == nil {
            head = temp
        } else {
            tail?.link = temp
        }
        tail = temp
    }

    mutating func pop() {
        if isEmpty { return }
        if head?.link == nil {
            head = nil
            tail = nil
        } else {
            head = head?.link
        }
    }
}

struct Pair: Hashable, Comparable {
    var row: Int
    var col: Int

    static func <(lhs: Self, rhs: Self) -> Bool {
        if lhs.row == rhs.row { return lhs.col < rhs.col }
        else { return lhs.row < rhs.row }
    }
}

func isCoinOutOfRange(_ coin: Pair) -> Bool {
    return coin.row < 0 || coin.row >= n || coin.col < 0 || coin.col >= m
}

func isOneCoinOutOfRange(_ coins: [Pair]) -> Int {
    let result1 = isCoinOutOfRange(coins[0])
    let result2 = isCoinOutOfRange(coins[1])
    if result1 && result2 { return -1 }
    else if result1 || result2 { return 1 }
    else { return 0 } 
}

let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
var a = [[String]]()
var coins : [Pair] = []
var v = Set<[Pair]>()
var q = Queue<([Pair], Int)>()

func bfs() -> Int {
    let dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    coins.sort()
    v.insert(coins)
    q.push((coins, 0))
    while !q.isEmpty {
        let coins = q.front!.0
        let cnt = q.front!.1
        q.pop()
        if cnt > 10 { continue }
        let result = isOneCoinOutOfRange(coins)
        if result == -1 { continue }
        if result == 1 { return cnt }
        for i in 0..<4 {
            var first = coins[0]
            var second = coins[1]
            var newR = first.row + dir[i][0]
            var newC = first.col + dir[i][1]
            var newP = Pair(row: newR, col: newC)
            if isCoinOutOfRange(newP) || a[newR][newC] == "." { first = newP }
            newR = second.row + dir[i][0]
            newC = second.col + dir[i][1]
            newP = Pair(row: newR, col: newC)
            if isCoinOutOfRange(newP) || a[newR][newC] == "." { second = newP }
            let newCoins = [first, second].sorted()
            if v.contains(newCoins) { continue }
            v.insert(newCoins)
            q.push((newCoins, cnt+1))
        }
    }
    return -1
}

for i in 0..<n {
    var s = readLine()!.map { String($0) }
    for j in s.indices {
        if s[j] == "o" {
            coins.append(Pair(row: i, col: j))
            s[j] = "."
        }
    }
    a.append(s)
}
print(bfs())