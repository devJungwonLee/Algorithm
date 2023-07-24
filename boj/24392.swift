let mod = 1000000007
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var a = [[Int]]()
for _ in 0..<n {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var d = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
var i = n - 1
while i >= 0 {
    for j in 0..<m {
        if a[i][j] == 0 { continue }
        if i == n - 1 { d[i][j] = 1 }
        else {
            if j > 0 { d[i][j] = (d[i][j] + d[i+1][j-1]) % mod }
            d[i][j] = (d[i][j] + d[i+1][j]) % mod
            if j < m - 1 { d[i][j] = (d[i][j] + d[i+1][j+1]) % mod }
        }
    }
    i -= 1
}
let answer = d[0].reduce(0) { ($0 + $1) % mod }
print(answer)