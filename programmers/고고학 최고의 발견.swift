import Foundation

var a = [[Int]]()
var answer = Int.max

func count(_ x: [Int]) -> Int? {
    var b = a
    let n = b.count
    for j in 0..<n {
        b[0][j] = (b[0][j] + x[j]) % 4
        if j < n - 1 { b[0][j+1] = (b[0][j+1] + x[j]) % 4 }
        b[1][j] = (b[1][j] + x[j]) % 4
        if j > 0 { b[0][j-1] = (b[0][j-1] + x[j]) % 4 }
    }
    var total = x.reduce(0, +)
    for i in 1..<n {
        for j in 0..<n {
            let cnt = (4 - b[i-1][j]) % 4
            total += cnt
            b[i][j] = (b[i][j] + cnt) % 4
            b[i-1][j] = (b[i-1][j] + cnt) % 4
            if j < n - 1 { b[i][j+1] = (b[i][j+1] + cnt) % 4 }
            if i < n - 1 { b[i+1][j] = (b[i+1][j] + cnt) % 4 }
            if j > 0 { b[i][j-1] = (b[i][j-1] + cnt) % 4 }
        }
    }
    if b[n-1].reduce(0, +) != 0 { return nil }
    return total
}

func recursive(_ x: [Int]) {
    if x.count == a.count {
        if let cnt = count(x) { answer = min(answer, cnt) }
        return
    }
    for i in 0..<4 {
        recursive(x + [i])
    }
}

func solution(_ clockHands:[[Int]]) -> Int {
    a = clockHands
    recursive([])
    return answer
}