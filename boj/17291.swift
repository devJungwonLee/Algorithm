let n = Int(readLine()!)!
var d = [Int](repeating: 0, count: n + 1)
d[0] = 1
for i in 1...n {
    d[i] = i == 1 ? 1 : d[i-1] * 2
    if i - 3 >= 1, (i - 3) % 2 == 1 { d[i] -= d[i-4] }
    if i - 4 >= 1, (i - 4) % 2 == 0 { d[i] -= d[i-5] }
}
print(d[n])