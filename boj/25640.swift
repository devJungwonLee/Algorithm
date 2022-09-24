let s = readLine()!
let n = Int(readLine()!)!
var a = [String]()
for _ in 0..<n {
    a.append(readLine()!)
}
print(a.filter { $0 == s }.count)
