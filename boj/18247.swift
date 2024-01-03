let t = Int(readLine()!)!
for _ in 0..<t {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    let (n, m) = (input[0], input[1])
    guard n >= 12 && m >= 4 else {
        print("-1")
        continue
    }
    print(11 * m + 4)
}