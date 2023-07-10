let input = readLine()!.split(separator: " ").map { Int($0)! }
let m = input[0]
let n = input[1]
var a = [[Int]]()
for _ in 0..<m {
    a.append(readLine()!.map { Int(String($0))! })
}
var d = [[Int]](repeating: [Int](repeating: 0, count: n), count: m)
for j in 0..<(n-1) {
    for i in 0..<m {
        if i > 0 { d[i-1][j+1] = max(d[i-1][j+1], d[i][j] + a[i][j]) }
        d[i][j+1] = max(d[i][j+1], d[i][j] + a[i][j])
        if i < m - 1 { d[i+1][j+1] = max(d[i+1][j+1], d[i][j] + a[i][j]) }
    }
}
print(d.map { $0.max()! }.max()!)