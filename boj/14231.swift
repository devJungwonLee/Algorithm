let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int](repeating: 0, count: n)
var answer = 0
for i in 0..<n {
    d[i] = 1
    for j in 0..<i {
        if a[i] > a[j] {
            d[i] = max(d[i], d[j] + 1)
        }
    }
    answer = max(answer, d[i])
}
print(answer)