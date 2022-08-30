import Foundation

var prev = 0
var pervConsume = 0
var currentConsume = 0
var totalConsume = 0

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
for phone in a {
    if phone == prev {
        currentConsume = pervConsume * 2 
    } else {
        currentConsume = 2
    }
    totalConsume += currentConsume
    pervConsume = currentConsume
    prev = phone
    if totalConsume >= 100 {
        totalConsume = 0
        prev = 0
    }
}
print(totalConsume)