let a = Int64(readLine()!)!
let b = Int64(readLine()!)!
let c = Int64(readLine()!)!
var counts = [Int](repeating: 0, count: 10)
let s = String(a*b*c).map { Int(String($0))! }
s.forEach { counts[$0] += 1 }
counts.forEach { print($0) }
