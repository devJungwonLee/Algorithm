let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [[Int]](repeating: [0, 0], count: n)
for i in 0..<n {
    if i == 0 {
        d[i][0] = a[i]
        d[i][1] = 0
    } else {
        if d[i-1][0] < 0 { d[i][0] = a[i] }
        else { d[i][0] = d[i-1][0] + a[i] }
        d[i][1] = max(d[i-1][1] + a[i], d[i-1][0])
    }
}
var answer = d[0][0]
for i in 1..<n {
    answer = max(answer, d[i][0])
    answer = max(answer, d[i][1])
}
print(answer)