let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var a = [[Int]]()
var d = [[[Int]]](repeating: [[Int]](repeating: [Int](repeating: 0, count: 3), count: m), count: n)

for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(input)
}

for i in 0..<n {
    for j in 0..<m {
        if i == 0 { 
            d[i][j][0] = a[i][j]
            d[i][j][1] = a[i][j]
            d[i][j][2] = a[i][j]
        }
        else {
            d[i][j][0] = Int.max
            if j > 0 { d[i][j][0] = min(d[i][j][0], d[i-1][j-1][2]) }
            d[i][j][0] = min(d[i][j][0], d[i-1][j][1])
            d[i][j][0] += a[i][j]

            d[i][j][1] = Int.max
            if j > 0 { d[i][j][1] = min(d[i][j][1], d[i-1][j-1][2]) }
            if j < m - 1 { d[i][j][1] = min(d[i][j][1], d[i-1][j+1][0]) }
            d[i][j][1] += a[i][j]

            d[i][j][2] = Int.max
            d[i][j][2] = min(d[i][j][2], d[i-1][j][1])
            if j < m - 1 { d[i][j][2] = min(d[i][j][2], d[i-1][j+1][0]) }
            d[i][j][2] += a[i][j]
        }
    }
}

var answer = d[n-1].map { $0.min()! }.min()!
print(answer)