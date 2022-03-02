import Foundation

var b = [[Int]]()
var v = [[Int]]()
var n = 0
let dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]

func dfs(_ p: (Int, Int), _ cost: Int, _ d: Int) {
    if cost > v[p.0][p.1] { return }
    v[p.0][p.1] = cost
    if p == (n-1, n-1) { return }
    for i in 0..<4 {
        let newr = p.0 + dir[i][0]
        let newc = p.1 + dir[i][1]
        if newr<0 || newr>=n || newc<0 || newc>=n { continue }
        if b[newr][newc] == 1 { continue }
        var newCost = cost + 100
        if d != -1, (d + i) % 2 != 0 { newCost += 500 }
        dfs((newr, newc), newCost, i)
    }
}

func solution(_ board:[[Int]]) -> Int {
    b = board
    n = board.count
    v = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    dfs((0, 0), 0, -1)
    return v[n-1][n-1]
}