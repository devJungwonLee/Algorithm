let n = Int(readLine()!)!
let s: Set<Int> = [3, 6, 9]
var answer = 0
for i in 1...n {
    var num = i
    while num > 0 {
        let r = num % 10
        if s.contains(r) {
            answer += 1
        }
        num /= 10
    }
}
print(answer)