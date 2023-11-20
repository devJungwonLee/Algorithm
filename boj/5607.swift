let n = Int(readLine()!)!
var a = 0
var b = 0
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    if input[0] == input[1] {
        a += input[0]
        b += input[1]
    } else if input[0] > input[1] {
        a += input[0] + input[1]
    } else {
        b += input[0] + input[1]
    }
}
print(a, b)