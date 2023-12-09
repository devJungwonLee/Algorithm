while let n = Int(readLine()!) {
    if n == -1 { break }
    var sum = 0
    var prev = 0
    for _ in 0..<n {
        let input = readLine()!.split(separator: " ").map { Int($0)! }
        sum += input[0] * (input[1] - prev)
        prev = input[1]
    }
    print("\(sum) miles")
}