import Foundation
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = abs(input[1] - input[0]) + 1
var d = [[Int]](repeating: [Int](repeating: 0, count: n), count: n)
for i in 0..<n {
    for j in 0...i {
        if j == 0 { d[i][j] = 1 }
        else { d[i][j] += d[i-1][j] + d[i][j-1] }
    }
}
print(d[n-1][n-1])