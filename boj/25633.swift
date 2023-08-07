let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [[[Int]]](repeating: [[Int]](repeating: [0, 0], count: n), count: n)
for i in 0..<n {
    for j in 0..<i {
        let sum = d[i-1][j][0]
        let num = d[i-1][j][1]
        if sum >= a[i] { d[i][j] = [sum + a[i], num + 1] }
        else { d[i][j] = d[i-1][j] }
    }
    d[i][i] = [a[i], 1]
}
print(d[n-1].map { $0[1] }.max()!)