let mod = 1000000007
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var d = [Int](repeating: 0, count: n + 1)
d[0] = 1
for i in 0..<n {
    if i + 1 <= n { d[i+1] = (d[i+1] + d[i]) % mod }
    if i + m <= n { d[i+m] = (d[i+m] + d[i]) % mod }
}
print(d[n])