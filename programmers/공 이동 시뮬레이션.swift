import Foundation

func solution(_ n:Int, _ m:Int, _ x:Int, _ y:Int, _ queries:[[Int]]) -> Int64 {
    var range = [y, y, x, x]
    for query in queries.reversed() {
        let d = query[0]
        let dx = query[1]
        switch d {
        case 0:
            range[1] = min(range[1] + dx, m - 1)
            if range[0] != 0 { 
                if range[0] + dx >= m { return 0 }
                range[0] += dx
            }
        case 1:
            range[0] = max(range[0] - dx, 0)
            if range[1] != m - 1 { 
                if range[1] - dx < 0 { return 0 }
                range[1] -= dx
            }
        case 2:
            range[3] = min(range[3] + dx, n - 1)
            if range[2] != 0 { 
                if range[2] + dx >= n { return 0 }
                range[2] += dx
            }
        default:
            range[2] = max(range[2] - dx, 0)
            if range[3] != n - 1 { 
                if range[3] - dx < 0 { return 0 }
                range[3] -= dx
            }
        }
    }
    let r = range.map { Int64($0) }
    return (r[1] - r[0] + 1) * (r[3] - r[2] + 1)
}