import Foundation

let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var s1 = Set<String>()
var s2 = Set<String>()
for _ in 0..<n { s1.insert(readLine()!) }
for _ in 0..<m { s2.insert(readLine()!) }
let a = Array(s1.intersection(s2)).sorted()
print(a.count)
a.forEach { print($0) }