let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m, k) = (input[0], input[1], input[2])
print(min(m, k) + min(n-m, n-k))
