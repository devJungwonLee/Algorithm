var n = Int(readLine()!)!
var i = 1
var answer = 0
while true {
    if n < i {
        if i % 2 == 1 { answer = i - n }
        break
    }
    n -= i
    i += 1
}
print(answer)