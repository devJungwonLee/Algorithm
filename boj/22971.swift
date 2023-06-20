let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int](repeating: 1, count: n)
for i in 0..<n {
    for j in 0..<i {
        if a[j] >= a[i] { continue }
        d[i] = (d[i] + d[j]) % 998244353
    }
}
print(d.map { String($0) }.joined(separator: " "))