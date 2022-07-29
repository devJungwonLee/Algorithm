import Foundation

var coef = [String: Int]()
var firstDigit = Set<String>()
var number = [String: Int]()
var answer = 0

let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.map { String($0) }
    (0..<s.count).forEach { index in
        let c = s[index]
        if index == 0 {firstDigit.insert(c) }
        if let num = coef[c] {
            coef[c] = num + Int(pow(10, Double(s.count-index-1)))
        } else {
            coef[c] = Int(pow(10, Double(s.count-index-1)))
        }
    }
}
if coef.keys.count == 10 {
    let zero = coef.keys.filter { !firstDigit.contains($0) }.min { coef[$0]! < coef[$1]! }!
    number[zero] = 0
}
let alphabets = coef.keys.sorted { coef[$0]! > coef[$1]! }
var num = 9
for alphabet in alphabets {
    if !number.keys.contains(alphabet) {
        number[alphabet] = num
        num -= 1
    }
}
for alphabet in alphabets {
    answer += number[alphabet]! * coef[alphabet]!
}
print(answer)