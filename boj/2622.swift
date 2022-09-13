let n = Int(readLine()!)!
var answer = 0
for i in 1...n {
    for j in i...n {
        let k = n-i-j
        if k < j { continue }
        if k >= i+j { continue }
        answer += 1
    }
}
print(answer)
