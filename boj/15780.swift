let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let a = readLine()!.split(separator: " ").map { Int($0)! }
let maximum = a.map { ($0 + 1) / 2 }.reduce(0, +)
n <= maximum ? print("YES") : print("NO")