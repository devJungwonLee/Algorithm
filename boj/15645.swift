let n = Int(readLine()!)!
var a = [[Int]]()
for _ in 0..<n {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var d = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
var e = [[Int]](repeating: [Int](repeating: 0, count: 3), count: n)
for i in 0..<n {
    if i == 0 { 
        d[i] = a[i]
        e[i] = a[i]
    }
    else {
        d[i][0] = a[i][0] + max(d[i-1][0], d[i-1][1])
        d[i][1] = a[i][1] + max(d[i-1][0], d[i-1][1], d[i-1][2])
        d[i][2] = a[i][2] + max(d[i-1][1], d[i-1][2])
        e[i][0] = a[i][0] + min(e[i-1][0], e[i-1][1])
        e[i][1] = a[i][1] + min(e[i-1][0], e[i-1][1], e[i-1][2])
        e[i][2] = a[i][2] + min(e[i-1][1], e[i-1][2])
    }
}
print(d[n-1].max()!, e[n-1].min()!)