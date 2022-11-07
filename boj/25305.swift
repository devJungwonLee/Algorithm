let s = readLine()!.split(separator: " ").map { Int($0)! }
let n = s[0]
let k = s[1]
let x = readLine()!.split(separator: " ").map { Int($0)! }.sorted { $0 > $1 }
print(x[k-1])
