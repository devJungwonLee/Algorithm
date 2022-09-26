_ = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var minValue = Int.max
var d = [Int](repeating: 0, count: a.count)
for i in 0..<a.count {
    if i == 0 { d[i] = 0 }
    else { d[i] = max(d[i-1], a[i]-minValue) }
    minValue = min(minValue, a[i])
    print(d[i], terminator:" ")
}
print("")
