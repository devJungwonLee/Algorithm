import Foundation

var t = [[Int]]()
var n = 0
var m = 0
var rowCount = 0
var colCount = 0

func flipRow(_ a: [[Int]]) -> [[Int]] {
    var a = a
    for i in 0..<n {
        if a[i][0] == t[i][0] { continue }
        for j in 0..<m { a[i][j] = 1 - a[i][j] }
        rowCount += 1
    }
    return a
}

func flipCol(_ a: [[Int]]) -> [[Int]] {
    var a = a
    for j in 0..<m {
        if a[0][j] == t[0][j] { continue }
        for i in 0..<n { a[i][j] = 1 - a[i][j] }
        colCount += 1
    }
    return a
}

func solution(_ beginning:[[Int]], _ target:[[Int]]) -> Int {
    var a = beginning
    t = target
    n = a.count
    m = a[0].count
    a = flipRow(a)
    a = flipCol(a)
    if a != t { return -1 }
    let count = rowCount + colCount
    return min(count, n + m - count)
}