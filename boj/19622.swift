let n = Int(readLine()!)!
var a = [[Int]]()
var d = [[Int]](repeating: [Int](repeating: 0, count: 2), count: n)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(input)
}
a.sort { $0[0] < $1[0] }
for i in 0..<n {
    if i == 0 {
        d[i][0] = 0
        d[i][1] = a[i][2]
    } else {
        let maxValue = max(d[i-1][0], d[i-1][1])
        d[i][0] = maxValue
        if a[i][0] >= a[i-1][1] {
            d[i][1] = maxValue + a[i][2]
        } else {
            d[i][1] = d[i-1][0] + a[i][2]
        }
    }
}
print(max(d[n-1][0], d[n-1][1]))