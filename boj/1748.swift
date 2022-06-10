import Foundation
let n = Int(readLine()!)!
var a = 10
var answer = 0
while true {
    if n >= a {
        answer += a / 10 * 9 * Int(log10(Double(a)))
        a *= 10
    } else {
        answer += (n - a / 10 + 1) * Int(log10(Double(a)))
        break
    }
}
print(answer)