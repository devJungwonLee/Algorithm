let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, k) = (input[0], input[1])
var current = 0
var answer = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (a, b) = (input[0], input[1])
    current = current + a - b
    if current > k { answer = max(answer, current - k) }
}
print(answer)