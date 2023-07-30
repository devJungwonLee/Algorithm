let mod = 987654321
let n = Int(readLine()!)!
var d = [[Int]](repeating: [Int](repeating: 0, count: 10), count: n)
for i in 0..<n {
    for j in 1...9 {
        if i == 0 { d[i][j] = 1 }
        else {
            if j - 2 >= 1 { d[i][j] = (d[i][j] + d[i-1][j-2]) % mod }
            if j - 1 >= 1 { d[i][j] = (d[i][j] + d[i-1][j-1]) % mod }
            d[i][j] = (d[i][j] + d[i-1][j]) % mod
            if j + 1 <= 9 { d[i][j] = (d[i][j] + d[i-1][j+1]) % mod }
            if j + 2 <= 9 { d[i][j] = (d[i][j] + d[i-1][j+2]) % mod }
        }
    }
}
let answer = d[n-1].reduce(0) { ($0 + $1) % mod }
print(answer)