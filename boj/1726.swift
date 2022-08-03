import Foundation

class Queue<T> {
    private var q: [T] = []
    private var head = 0
    private var tail = -1

    var isEmpty: Bool {
        return head > tail
    }

    var front: T? {
        if isEmpty { return nil }
        return q[head]
    }

    func push(_ data: T) {
        q.append(data)
        tail += 1
    }

    func pop() {
        if !isEmpty { head += 1 }
    }
}

enum Direction: Int {
    case east = 0, west, south, north

    var right: Direction {
        switch self {
        case .east: return .south
        case .west: return .north
        case .south: return .west
        case .north: return .east
        }
    }

    var left: Direction {
        switch self {
        case .east: return .north
        case .west: return .south
        case .south: return .east
        case .north: return .west
        }
    }

    var delta: [Int] {
        switch self {
        case .east: return [0, 1]
        case .west: return [0, -1]
        case .south: return [1, 0]
        case .north: return [-1, 0]
        }
    }
}

struct Position: Equatable {
    var row: Int
    var col: Int
    var direction: Direction
}

var s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let m = s[0]
let n = s[1]
var a = [[Int]]()

for _ in 0..<m {
    s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    a.append(s)
}

var v = [[[Int]]](
    repeating: [[Int]](
        repeating: [Int](repeating: -1, count: 4),
        count: n
    ),
    count: m
)

var start = Position(row: 0, col: 0, direction: .east)
var end = Position(row: 0, col: 0, direction: .east)
s = readLine()!.components(separatedBy: " ").map { Int($0)! }
start.row = s[0] - 1
start.col = s[1] - 1
start.direction = Direction(rawValue: s[2] - 1)!
s = readLine()!.components(separatedBy: " ").map { Int($0)! }
end.row = s[0] - 1
end.col = s[1] - 1
end.direction = Direction(rawValue: s[2] - 1)!

func bfs() -> Int {
    let q = Queue<Position>()
    v[start.row][start.col][start.direction.rawValue] += 1
    q.push(start)
    while (!q.isEmpty) {
        let current = q.front!
        q.pop()
        if current == end { 
            return v[current.row][current.col][current.direction.rawValue] 
        }
        for i in 1...3 {
            let newr = current.row + i * current.direction.delta[0]
            let newc = current.col + i * current.direction.delta[1]
            if newr < 0 || newr >= m || newc < 0 || newc >= n { continue }
            if a[newr][newc] == 1 { break }
            let newDirection = current.direction
            if v[newr][newc][newDirection.rawValue] >= 0 { continue }
            v[newr][newc][newDirection.rawValue] = v[current.row][current.col][current.direction.rawValue] + 1
            let next = Position(row: newr, col: newc, direction: newDirection)
            q.push(next)
        }
        let newr = current.row
        let newc = current.col
        var newDirection = current.direction.left
        if v[newr][newc][newDirection.rawValue] == -1 { 
            v[newr][newc][newDirection.rawValue] = v[current.row][current.col][current.direction.rawValue] + 1
            q.push(Position(row: newr, col: newc, direction: newDirection))
        }
        newDirection = current.direction.right
        if v[newr][newc][newDirection.rawValue] == -1 { 
            v[newr][newc][newDirection.rawValue] = v[current.row][current.col][current.direction.rawValue] + 1
            q.push(Position(row: newr, col: newc, direction: newDirection))
        }
    }
    return -1
}
print(bfs())