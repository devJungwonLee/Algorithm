_ = readLine()!
let a = readLine()!.split(separator: " ").map { Int($0)! }
let b = readLine()!.split(separator: " ").map { Int($0)! }
let sa = Set(a)
let sb = Set(b)
print(a.filter { !sb.contains($0) }.count + b.filter { !sa.contains($0) }.count)
