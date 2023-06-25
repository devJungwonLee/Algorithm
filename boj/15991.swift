let mod = 1000000009
let t = Int(readLine()!)!
var inputs = [Int]()
for _ in 0..<t {
    inputs.append(Int(readLine()!)!)
}
let n = inputs.max()!
var d = [Int](repeating: 0, count: n + 1)
d[0] = 1
d[1] = 1
d[2] = 2
d[3] = 2
if n >= 4 {
    for i in 4...n {
        if i >= 2 { d[i] = (d[i] + d[i-2]) % mod }
        if i >= 4 { d[i] = (d[i] + d[i-4]) % mod }
        if i >= 6 { d[i] = (d[i] + d[i-6]) % mod }
    }
}
inputs.forEach { print(d[$0]) }