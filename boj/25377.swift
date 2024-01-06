let n = Int(readLine()!)!
var answer = Int.max
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] > input[1] { continue }
    answer = min(answer, input[1])
}
if answer == Int.max { answer = -1 }
print(answer)
