let mod = 1000000007
let n = Int(readLine()!)!
var d = [[Int]](repeating: [Int](repeating: 0, count: 5), count: n)
for i in 0..<n {
    for j in 0..<5 {
        if i == 0 { d[i][j] = 1 }
        else {
            for k in 0..<5 {
                if j == 0, k == 0 { continue }
                else if j != 0, k != 0, abs(j-k) <= 1 { continue }
                d[i][j] = (d[i][j] + d[i-1][k]) % mod
            }
        }
    }
}
print(d[n-1].reduce(0) { ($0 + $1) % mod })