import Foundation
let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
var a = s[0]
let b = s[1]
var n = s[2]
var q = 0

while n > 0 {
    a = a % b * 10
    q = a / b
    n -= 1
}
print(q)