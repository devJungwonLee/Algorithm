let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
let m = Int(readLine()!)!
let b = readLine()!.split(separator: " ").map { Int($0)! }
var s = Set<Int>()
var score = 0
b.forEach { s.insert($0) }
for x in a {
    score += x
    if s.contains(score) { score = 0 }
}
print(score)