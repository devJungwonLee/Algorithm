let input = readLine()!.split(separator: " ").map { Int($0)! }
let diff = input[1] - input[0]
let answer = diff / input[2] + (diff % input[2] == 0 ? 0 : 1)
print(answer)