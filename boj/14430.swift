let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var a = [[Int]]()
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(input)
}
var d = [[Int]](repeating: [Int](repeating: 0, count: m), count: n)
for i in 0..<n {
    for j in 0..<m {
        var maxValue = 0
        if i > 0 { maxValue = max(maxValue, d[i-1][j]) }
        if j > 0 { maxValue = max(maxValue, d[i][j-1]) }
        d[i][j] = a[i][j] + maxValue
    }
}
print(d[n-1][m-1])