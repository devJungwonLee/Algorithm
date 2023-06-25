let mod = 1000000009
var d = [[Int]](repeating: [Int](repeating: 0, count: 1001), count: 1001)
d[1][1] = 1
d[2][1] = 1
d[3][1] = 1
d[2][2] = 1
d[3][2] = 2
d[3][3] = 1

for i in 4...1000 {
    for j in 2...i {
        d[i][j] = (d[i][j] + d[i-1][j-1]) % mod
        d[i][j] = (d[i][j] + d[i-2][j-1]) % mod
        d[i][j] = (d[i][j] + d[i-3][j-1]) % mod
    }
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let n = input[0]
    let m = input[1]
    print(d[n][m])
}