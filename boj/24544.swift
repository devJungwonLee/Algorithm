import Foundation

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
let b = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(a.reduce(0, +))
print((0..<n).filter { b[$0] == 0 }.map { a[$0] }.reduce(0, +))
