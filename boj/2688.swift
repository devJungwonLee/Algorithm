var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: 65)
var a = [Int]()
let t = Int(readLine()!)!
var m = 0
for _ in 0..<t {
    let n = Int(readLine()!)!
    a.append(n)
    m = max(m, n)
}
for i in 1...m {
    for j in 0...9 {
        if i == 1 && j == 0 { d[i][j] = 1 }
        else if j == 0 { d[i][j] = d[i-1][j] }
        else if i == 1 { d[i][j] = d[i][j-1] + 1 }
        else { d[i][j] = d[i][j-1] + d[i-1][j] }
    }
}
a.forEach { print(d[$0][9]) }
