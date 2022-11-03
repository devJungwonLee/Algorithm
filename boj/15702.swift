import Foundation
let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let m = s[1]
var ids = [String]()
var totals = [Int]()
let points = readLine()!.split(separator: " ").map { Int($0)! }
for _ in 0..<m {
    var s = readLine()!.components(separatedBy: " ")
    ids.append(s.removeFirst())
    totals.append((0..<n).filter { s[$0] == "O" }.map { points[$0] }.reduce(0, +))
}
let i = (0..<m).max {
    if totals[$0] == totals[$1] {
        return Int(ids[$0])! > Int(ids[$1])!
    }
    return totals[$0] < totals[$1]
}!
print(ids[i], totals[i])
