let mod = 1000000009
let t = Int(readLine()!)!
var inputs = [[Int]]()
for _ in 0..<t {
    inputs.append(readLine()!.split(separator: " ").map { Int($0)! })
}
let maxN = inputs.map { $0[0] }.max()!
var d = [[Int]](repeating: [Int](repeating: 0, count: maxN + 1), count: maxN + 1)
d[1][1] = 1
d[2][1] = 1
d[2][2] = 1
d[3][1] = 1
d[3][2] = 2
d[3][3] = 1
for i in 4...maxN {
    for j in 1...i {
        if i > 1 { d[i][j] = (d[i][j] + d[i-1][j-1]) % mod }
        if i > 2 { d[i][j] = (d[i][j] + d[i-2][j-1]) % mod }
        if i > 3 { d[i][j] = (d[i][j] + d[i-3][j-1]) % mod }
    }
}
for input in inputs {
    let n = input[0]
    let m = input[1]
    print(Array(d[n][1...m]).reduce(0) { ($0 + $1) % mod })
}