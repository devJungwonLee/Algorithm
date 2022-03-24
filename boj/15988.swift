import Foundation

let mod = 1000000009
var d = [Int](repeating: 0, count: 1000001)
d[0] = 1
for i in 1...1000000 {
    if i - 1 >= 0 { d[i] = (d[i] + d[i-1]) % mod }
    if i - 2 >= 0 { d[i] = (d[i] + d[i-2]) % mod }
    if i - 3 >= 0 { d[i] = (d[i] + d[i-3]) % mod }
}

let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    print(d[n])
}