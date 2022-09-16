let x = 1000000007
let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
var d = [[Int]](repeating: [Int](repeating: 0, count: m+1), count: n+1)
for i in 1...n {
    for j in 1...m {
        if i == 1 && j == 1 { d[i][j] = 1 }
        else { d[i][j] = (d[i-1][j-1]%x + d[i-1][j]%x + d[i][j-1]%x) % x }
    }
}
print(d[n][m])
