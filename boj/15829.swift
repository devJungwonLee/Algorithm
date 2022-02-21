import Foundation
let m = 1234567891
let l = Int(readLine()!)!
let s = readLine()!
var answer = 0
for (i, c) in s.enumerated() {
    let a = Int(c.asciiValue!) - 96
    var r = 1
    for _ in 0..<i { r = r * 31 % m }
    answer = (answer + (a * r % m)) % m 
}
print(answer)