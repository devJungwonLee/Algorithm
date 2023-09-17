let n = Int(readLine()!)!
var count = 0
for i in 1..<n {
    var j = i
    var contains = false
    while j >= 10 {
        let r = j % 100
        if r == 50 {
            contains = true
            break
        }
        j /= 10
    }
    if contains { count += 1 }
}
print(n + count)