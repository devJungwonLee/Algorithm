let s = readLine()!.map { String($0) }
let n = s.count
var r = 0
for i in 1...n {
    if n % i != 0 { continue }
    if n / i < i { break }
    r = i
}
var c = n / r
var a = [[String]](repeating: [String](repeating: "", count: c), count: r)
for j in 0..<c {
    for i in 0..<r {
        a[i][j] = s[j*r+i]
    }
}
print(a.map { $0.joined() }.joined())
