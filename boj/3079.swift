import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var t = [Int]()
for _ in 0..<n { t.append(Int(readLine()!)!) }
var left: Int64 = 1
var right = Int64.max - 1
while (left < right) {
    let mid = (left + right) / 2
    var sum: Int64 = 0
    for time in t {
        sum += mid / Int64(time)
        if sum >= Int64(m) { break }
    }
    if sum >= Int64(m) { right = mid }
    else { left = mid + 1 }
}
print(left)