let input = readLine()!.split(separator: " ").map { Int($0)! }
let h = input[0]
let w = input[1]
var a = [[Int]]()
var b = [[Int]]()
for _ in 0..<h {
    a.append(readLine()!.split(separator: " ").map { Int($0)! })
}
for _ in 0..<h {
    b.append(readLine()!.split(separator: " ").map { Int($0)! })
}
var d = [[Int]](repeating: [Int](repeating: Int.max, count: w), count: h)
for i in 0..<h {
    for j in 0..<w {
        if i == 0 {
            d[i][j] = 0
        } else {
            d[i][j] = d[i-1][j]
            if j > 0 { d[i][j] = min(d[i][j], d[i-1][j-1]) }
            if j < w - 1 { d[i][j] = min(d[i][j], d[i-1][j+1]) }
        }
        d[i][j] += (a[i][j] - b[i][j]) * (a[i][j] - b[i][j])
    }
}
print(d[h-1].min()!)