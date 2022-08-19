import Foundation

let n = Int(readLine()!)!
var weights = [Int]()
for _ in 0..<n {
    weights.append(Int(readLine()!)!)
}
let answer = weights.sorted { $0 > $1 }.enumerated().map { ($0 + 1) * $1 }.max()!
print(answer)