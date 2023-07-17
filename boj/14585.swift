var candy = Set<[Int]>()
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var r = 0
var c = 0
for _ in 0..<n {
    let p = readLine()!.split(separator: " ").map { Int($0)! }
    r = max(r, p[0])
    c = max(c, p[1])
    candy.insert(p)
}
var d = [[Int]](repeating: [Int](repeating: 0, count: c + 1), count: r + 1)
for i in 0...r {
    for j in 0...c {
        let up = i > 0 ? d[i-1][j] : 0
        let left = j > 0 ? d[i][j-1] : 0
        d[i][j] = max(up, left)
        if candy.contains([i, j]) {
            d[i][j] += max(0, m - (i + j))
        }
    }
}
print(d[r][c])