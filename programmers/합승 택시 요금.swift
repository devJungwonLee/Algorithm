import Foundation

func solution(_ n:Int, _ s:Int, _ a:Int, _ b:Int, _ fares:[[Int]]) -> Int {
    var d = [[Int]](repeating: [Int](repeating: Int.max, count: n), count: n)
    for fare in fares {
        let v1 = fare[0] - 1
        let v2 = fare[1] - 1
        let cost = fare[2]
        d[v1][v2] = cost
        d[v2][v1] = cost
    }
    for k in 0..<n {
        for i in 0..<n {
            for j in 0..<n {
                if i == j { d[i][j] = 0 }
                if d[i][k] == Int.max || d[k][j] == Int.max { continue }
                d[i][j] = min(d[i][j], d[i][k] + d[k][j])
            }
        }
    }
    var answer = 0
    if d[s - 1][a - 1] == Int.max || d[s - 1][b - 1] == Int.max {
        answer = Int.max
    } else { answer = d[s - 1][a - 1] + d[s - 1][b - 1] }
    for k in 0..<n {
        if d[s - 1][k] == Int.max || d[k][a - 1] == Int.max || d[k][b - 1] == Int.max {
            continue
        }
        answer = min(answer, d[s-1][k] + d[k][a-1] + d[k][b-1])
    }
    return answer
}