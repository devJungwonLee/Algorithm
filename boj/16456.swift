let mod = 1000000009
let n = Int(readLine()!)!
var d = [Int](repeating: 0, count: n + 1)
d[1] = 1
if n == 1 { print(d[1]) }
else {
    for i in 2...n {
        d[i] = (d[i] + d[i-1]) % mod
        if i - 3 >= 1 { d[i] = (d[i] + d[i-3]) % mod }
    }
    print((d[n] + d[n-2]) % mod)
}