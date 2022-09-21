let n = Int(readLine()!)!
let a = readLine()!.split(separator: " ").map { Int($0)! }
var d = [Int: Int]()
Array(Set(a)).sorted().enumerated().forEach { d[$1] = $0 }
print(a.map { String(d[$0]!) }.joined(separator: " "))
