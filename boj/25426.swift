import Foundation

let n = Int(readLine()!)!
var ab: [[Int]] = []
for _ in 0..<n {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    ab.append(s)
}
ab.sort { lhs, rhs in
    if lhs[0] == rhs[0] {
        return lhs[1] < rhs[1]
    }
    return lhs[0] < rhs[0]
}
let answer: Int = (1...n).map { (x: Int) -> Int in
    ab[x-1][0] * x + ab[x-1][1]
}.reduce(0, +)
print(answer)