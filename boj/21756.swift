let n = Int(readLine()!)!
var a = Array(1...n)
while a.count > 1 {
    a = (0..<a.count).filter { ($0 + 1) % 2 == 0 }.map { a[$0] }
}
print(a.first!)