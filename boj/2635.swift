let n = Int(readLine()!)!
var answer = [Int]()
for i in 1...n {
    var a = n
    var b = i
    var temp = [a, b]
    while a - b >= 0 {
        let c = a - b
        temp.append(c)
        a = b
        b = c
    }
    if temp.count > answer.count {
        answer = temp
    }
}
print(answer.count)
print(answer.map { String($0) }.joined(separator: " "))
