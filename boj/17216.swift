let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int](repeating: 0, count: n)
var answer = 0
for i in 0..<n {
    d[i] = a[i]
    for j in 0..<i {
        if a[j] <= a[i] { continue }
        d[i] = max(d[i], d[j] + a[i])
    }
    answer = max(answer, d[i])
}
print(answer)