let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int](repeating: 0, count: n)
var answer = 1
d[0] = 1
for i in 1..<n {
    var maxValue = 1
    for j in 0..<i {
        if a[j] >= a[i] { continue }
        maxValue = max(maxValue, d[j] + 1)
    }
    d[i] = maxValue
    answer = max(answer, d[i])
}
print(answer)