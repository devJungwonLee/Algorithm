import Foundation

var r = 0
var c = 0
var visited: [[[Bool]]] = []
var answer: [Int] = []

func countCycleLength(_ grid: [[String]], _ info: (Int, Int, Int)) {
    let dir = [[-1, 0], [0, 1], [1, 0], [0, -1]]
    var cnt = 0
    var i = info.0
    var j = info.1
    var d = info.2
    while true {
        if visited[i][j][d] { break }
        visited[i][j][d] = true
        cnt += 1
        let ch = grid[i][j]
        switch ch {
            case "L": d = (d + 3) % 4
            case "R": d = (d + 1) % 4
            default: break
        }
        i = i + dir[d][0]
        j = j + dir[d][1]
        if i < 0 { i = r - 1 }
        if i >= r { i = 0 }
        if j < 0 { j = c - 1 }
        if j >= c { j = 0 }
    }
    answer.append(cnt)
}

func solution(_ grid:[String]) -> [Int] {
    let grid = grid.map { $0.map { String($0) } }
    r = grid.count
    c = grid[0].count
    visited = Array(repeating: Array(repeating: Array(repeating: false, count: 4), count: c), count: r)
    for i in 0..<r {
        for j in 0..<c {
            for d in 0..<4 {
                if visited[i][j][d] { continue }
                countCycleLength(grid, (i, j, d))
            }
        }
    }
    answer.sort()
    return answer
}