import Foundation
let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let k = input[1]
let end = n * 3600 + 59 * 60 + 59
var count = 0
for t in 0...end {
    let hour = String(format: "%02d", t / 3600)
    let minute = String(format: "%02d", t % 3600 / 60)
    let second = String(format: "%02d", t % 3600 % 60)
    let c = String(k).first!
    if hour.contains(c) || minute.contains(c) || second.contains(c) {
        count += 1
    }
}
print(count)