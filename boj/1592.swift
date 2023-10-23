let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
let l = input[2]
var received = [Int](repeating: 0, count: n)
var current = 0
var answer = 0
received[0] += 1
while received[current] < m {
    if received[current] % 2 == 1 {
        current = (current + l) % n
    } else {
        current = (current - l + n) % n
    }
    received[current] += 1
    answer += 1
}
print(answer)