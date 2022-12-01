let n = Int(readLine()!)!
let h = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int](repeating: 0, count: n)
var i = n - 1
while i >= 0 {
    let next = i + 1 + h[i]
    d[i] = 1 + (next >= n ? 0 : d[next])
    i -= 1
}
print(d.map { String($0) }.joined(separator: " "))
