let n = Int(readLine()!)!
for _ in 0..<n { _ = readLine()! }
var a = [[Int]](repeating: [Int](repeating: 0, count: n + 1), count: 2 * n + 1)
for i in 0...(2 * n) {
    let end = min(i, n)
    for j in 0...end {
        if j == 0 || j == i { a[i][j] = 1 }
        else { a[i][j] = (a[i-1][j-1] + a[i-1][j]) % 1000000007 }
    }
}
print(a[2 * n][n], n * n)