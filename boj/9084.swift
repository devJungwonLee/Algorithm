let t = Int(readLine()!)!
for _ in 0..<t {
    let n = Int(readLine()!)!
    let coins = readLine()!.split(separator: " ").map { Int($0)! }
    let m = Int(readLine()!)!
    var d = [[Int]](repeating: [Int](repeating: 0, count: n), count: m + 1)
    for i in 1...m {
        for j in 0..<n {
            if i - coins[j] < 0 { break }
            else if i == coins[j] { d[i][j] += 1 }
            else {
                for k in 0...j {
                    d[i][j] += d[i - coins[j]][k]
                }
            }
        }
    }
    print(d[m].reduce(0, +))
}
