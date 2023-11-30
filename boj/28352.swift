let n = Int64(readLine()!)!
var s = Int64(1)
(1...n).forEach { s *= $0 }
print(s / 604800)