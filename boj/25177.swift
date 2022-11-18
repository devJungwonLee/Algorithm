let s = readLine()!.split(separator: " ").map { Int($0)! }
var a = readLine()!.split(separator: " ").map { Int($0)! }
var b = readLine()!.split(separator: " ").map { Int($0)! }
while a.count > b.count { b.append(0) }
while a.count < b.count { a.append(0) }
let maxValue = (0..<a.count).map { b[$0] - a[$0] }.max()!
print(max(0, maxValue))
