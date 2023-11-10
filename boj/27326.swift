let n = Int(readLine()!)!
var flags = [Bool](repeating: false, count: n + 1)
let input = readLine()!.split(separator: " ").map { Int($0)! }
input.forEach { flags[$0].toggle() }
print((1...n).filter { flags[$0] }.first!)