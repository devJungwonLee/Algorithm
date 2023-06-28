let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var a = [[Int]]()
for _ in 0..<n {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var d = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for i in 0..<n {
    for j in 0..<m {
        d[i][j] += a[i][j]
        if i > 0 { d[i][j] += d[i-1][j] }
        if j > 0 { d[i][j] += d[i][j-1] }
        if i > 0, j > 0 { d[i][j] -= d[i-1][j-1] }
    }
}
let k = Int(readLine()!)!
for _ in 0..<k {
    let s = readLine()!.split(separator: " ").map { Int($0)! - 1 }
    var sum = d[s[2]][s[3]]
    if s[0] > 0 { sum -= d[s[0] - 1][s[3]] }
    if s[1] > 0 { sum -= d[s[2]][s[1] - 1] }
    if s[0] > 0, s[1] > 0 { sum += d[s[0] - 1][s[1] - 1] }
    print(sum)
}