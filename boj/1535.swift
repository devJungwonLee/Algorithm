let n = Int(readLine()!)!
let give = readLine()!.split(separator: " ").map { Int($0)! }
let take = readLine()!.split(separator: " ").map { Int($0)! }

var d = [[Int]](repeating: [Int](repeating: 0, count: 101), count: n)
for i in 0..<n {
    for j in 1...100 {
        if i == 0 {
            if j > give[i] {
                d[i][j] = take[i]
            } else {
                d[i][j] = 0
            }
        } else {
            if j > give[i] {
                d[i][j] = max(d[i-1][j], d[i-1][j-give[i]] + take[i])
            } else {
                d[i][j] = d[i-1][j]
            }
        }
    }
}
print(d[n-1][100])