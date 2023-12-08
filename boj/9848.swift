let input = readLine()!.split(separator: " ").map { Int($0)! }
var prev = 0
var answer = 0
for _ in 0..<input[0] {
    let current = Int(readLine()!)!
    if prev > 0 && prev - current >= input[1] { answer += 1 }
    prev = current
}
print(answer)