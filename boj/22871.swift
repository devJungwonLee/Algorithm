let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int64](repeating: Int64.max, count: n)
d[0] = 0
for i in 1..<n {
    for j in 0..<i {
        var power  = Int64(abs(a[i] - a[j])) + 1
        power = power * Int64(i - j)
        d[i] = min(d[i], max(d[j], power))
    }
}
print(d[n-1])