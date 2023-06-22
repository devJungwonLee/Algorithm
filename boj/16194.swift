let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
a.insert(0, at: 0)
var d = [Int](repeating: 0, count: n+1)
for i in 1...n {
    d[i] = a[i]
    for j in 1..<i {
        d[i] = min(d[i], d[j] + d[i-j])
    }
}
print(d[n])