import Foundation

enum Direction {
    case horizontal, vertical
}

let n = Int(readLine()!)!
var a = [[String]]()
var answer = 0

func findMax(_ arr: [[String]], _ r: Int, _ c: Int, _ d: Direction) {
    var arr = arr

    if d == .horizontal {
        if arr[r][c] == arr[r][c+1] { return }
        let tmp = arr[r][c]
        arr[r][c] = arr[r][c+1]
        arr[r][c+1] = tmp
    } else {
        if arr[r][c] == arr[r+1][c]  { return }
        let tmp = arr[r][c]
        arr[r][c] = arr[r+1][c]
        arr[r+1][c] = tmp
    }
    for i in 0..<n {
        var cnt = 0
        for j in 0..<n {
            if j == 0 { cnt = 1 }
            else if arr[i][j] == arr[i][j-1] { cnt += 1 }
            else {
                answer = max(answer, cnt)
                cnt = 1
            }
        }
        answer = max(answer, cnt)
    }
    for j in 0..<n {
        var cnt = 0
        for i in 0..<n {
            if i == 0 { cnt = 1 }
            else if arr[i][j] == arr[i-1][j] { cnt += 1 }
            else {
                answer = max(answer, cnt)
                cnt = 1
            }
        }
        answer = max(answer, cnt)
    }
}

for _ in 0..<n {
    a.append(readLine()!.map { String($0) })
}

for i in 0..<n {
    for j in 0..<n {
        if i + 1 < n { findMax(a, i, j, .vertical) }
        if j + 1 < n { findMax(a, i, j, .horizontal) }
    }
}

print(answer)