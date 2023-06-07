import Foundation

var adj = [[Int]]()
var d = [[Int]]()
var visited = Set<Int>()

func recursive(_ x: Int) {
    visited.insert(x)
    d[x][0] = 0
    d[x][1] = 1
    for y in adj[x] {
        if visited.contains(y) { continue }
        recursive(y)
        d[x][0] += d[y][1]
        d[x][1] += min(d[y][0], d[y][1])
    }
}

func solution(_ n:Int, _ lighthouse:[[Int]]) -> Int {
    adj = [[Int]](repeating: [], count: (n + 1))
    d = [[Int]](repeating: [Int](repeating: 0, count: 2), count: (n + 1))
    for e in lighthouse {
        adj[e[0]].append(e[1])
        adj[e[1]].append(e[0])
    }
    recursive(1)
    return min(d[1][0], d[1][1])
}