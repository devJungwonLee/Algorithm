import Foundation

var sum = 0
let total = Int(readLine()!)!
let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    sum += s[0] * s[1]
}
sum == total ? print("Yes") : print("No")