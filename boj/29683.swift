var input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, a) = (input[0], input[1])
input = readLine()!.split(separator: " ").map { Int($0)! }
print(input.map { $0 / a }.reduce(0, +))