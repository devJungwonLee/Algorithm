let n = Int(readLine()!)!
var d = [Bool](repeating: false, count: n + 1)
for i in 1...n {
    if i == 1 { d[i] = false }
    else if i < 4 {
        d[i] = !d[i-1]
    } else if i < 5 {
        d[i] = !d[i-1] || !d[i-3]
    } else {
        d[i] = !d[i-1] || !d[i-3] || !d[i-4]
    }
}
print(d[n] ? "SK" : "CY")