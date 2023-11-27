let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var a = [Int](repeating: 0, count: m)
for _ in 0..<n {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    (0..<m).forEach { a[$0] += input[$0] }
}
let answer = (1...m).sorted { lhs, rhs in
    if a[lhs - 1] == a[rhs - 1] { return lhs < rhs }
    return a[lhs - 1] > a[rhs - 1]
}.map { String($0) }.joined(separator: " ")
print(answer)