import Foundation
let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!
    let sum = s.map { Int(String($0))! }.reduce(0, +)
    let three = Int(s)! % 1000 * 10
    var key = sum + three
    if key >= 10000 { key = key % 10000 }
    else if key < 1000 { key += 1000 }
    print(String(format: "%04d", key))
}