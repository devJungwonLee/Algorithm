import Foundation
let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let a = Set<Int>(readLine()!.components(separatedBy: " ").map { Int($0)! })
let b = Set<Int>(readLine()!.components(separatedBy: " ").map { Int($0)! })
let answer = Array(a).filter { !b.contains($0) }.sorted()
print(answer.count)
print(answer.map { String($0) }.joined(separator: " "))