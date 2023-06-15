var a = [Int]()
let n = Int(readLine()!)!
for _ in 0..<n { a.append(Int(readLine()!)!) }
var d = [Int](repeating: 0, count: n)
var answer = 0
for i in 0..<n {
    d[i] = a[i]
    if i == 0 { continue }
    for j in 0..<i {
        if a[j] >= a[i] { continue }
        d[i] = max(d[i], d[j] + a[i])
    }
    answer = max(answer, d[i])
}
print(answer)