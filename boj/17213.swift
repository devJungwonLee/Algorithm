var n = Int(readLine()!)!
let m = Int(readLine()!)!
var r = m - n
n = n + r - 1
if r > n - r { r = n - r }
var d = [[Int]](repeating: [Int](repeating: 0, count: r + 1), count: n + 1)
for i in 0...n {
    for j in 0...min(i, r) {
        if j == 0 || j == i { d[i][j] = 1 }
        else { d[i][j] = d[i-1][j-1] + d[i-1][j] }
    }
}
print(d[n][r])