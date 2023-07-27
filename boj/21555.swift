let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = Int64(input[1])
let a = readLine()!.split(separator: " ").map { Int64($0)! }
let b = readLine()!.split(separator: " ").map { Int64($0)! }
var d = [[Int64]](repeating: [Int64](repeating: Int64.max, count: 2), count: n)
for i in 0..<n {
    if i == 0 {
        d[i][0] = a[i]
        d[i][1] = b[i]
    } else {
        d[i][0] = min(d[i-1][0] + a[i], d[i-1][1] + a[i] + k)
        d[i][1] = min(d[i-1][0] + b[i] + k, d[i-1][1] + b[i])
    }
}
print(d[n-1].min()!)