let input = readLine()!.split(separator: " ").map { Int($0)! }
let (n, m) = (input[0], input[1])
var a = [Int]()
for _ in 0..<n {
    a.append(Int(readLine()!)!)
}
for i in 1...m {
    for j in 1..<n {
        if a[j-1] % i > a[j] % i {
            a.swapAt(j-1, j)
        }
    }
}
print(a.map { String($0) }.joined(separator: "\n"))