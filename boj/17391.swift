let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var a = [[Int]]()
var d = [[Int]](repeating: [Int](repeating: Int.max, count: m), count: n)
for _ in 0..<n {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}
d[0][0] = 0
for i in 0..<n {
    for j in 0..<m {
        let x = a[i][j]
        for k in 1...x {
            if i + k < n { d[i+k][j] = min(d[i+k][j], d[i][j] + 1) }
            if j + k < m { d[i][j+k] = min(d[i][j+k], d[i][j] + 1) }
        }
    }
}
print(d[n-1][m-1])