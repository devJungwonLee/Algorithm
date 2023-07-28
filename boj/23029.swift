let n = Int(readLine()!)!
var a = [Int]()
for _ in 0..<n {
    a.append(Int(readLine()!)!)
}
var d = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
d[0][1] = a[0]
for i in 1..<n {
    d[i][0] = max(d[i-1][0], d[i-1][1], d[i-1][2])
    d[i][1] = d[i-1][0] + a[i]
    d[i][2] = d[i-1][1] + a[i] / 2
}
print(d[n-1].max()!)