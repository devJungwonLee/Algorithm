let n = Int(readLine()!)!
var count = 0
for i in 1...n {
    if i % 2 == 1 { continue }
    if n - i == 0 { continue }
    for j in 1...(n-i) {
        let k = n - i - j
        if k >= j + 2 { count += 1 }
    }
}
print(count)