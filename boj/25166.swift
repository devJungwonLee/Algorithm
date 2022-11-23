import Foundation
let str = readLine()!.split(separator: " ").map { Int($0)! }
let s = str[0]
let m = str[1]
var coins = [512, 256, 128, 64, 32, 16, 8, 4, 2, 1]
if s <= 1023 { print("No thanks") }
else {
    var coogie = [Int]()
    var x = m
    var i = 0
    while x > 0 {
        while coins[i] > x { i += 1 }
        coogie.append(coins[i])
        x -= coins[i]
    }
    x = 1
    for _ in 0..<coogie.count { x *= 2 }
    var success = false
    for i in 0..<x {
        var y = i
        var sum = 0
        for j in 0..<coogie.count {
            let r = y % 2
            if r == 1 { sum += coogie[j] }
            y /= 2
        }
        if sum == s - 1023 {
            success = true
            break
        }
    }
    success ? print("Thanks") : print("Impossible")
}
