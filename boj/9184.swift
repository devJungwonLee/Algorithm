import Foundation

var memo = [[[Int]]](
    repeating: [[Int]](
        repeating: [Int](repeating: 0, count: 21),
        count: 21
    ),
    count: 21
)

func w(_ a: Int, _ b: Int, _ c: Int) -> Int {
    if a <= 0 || b <= 0 || c <= 0 { return 1 }
    if a > 20 || b > 20 || c > 20 { return w(20, 20, 20) }
    if memo[a][b][c] > 0 { return memo[a][b][c] }
    if a < b, b < c {
        let r1 = w(a, b, c - 1)
        let r2 = w(a, b - 1, c - 1)
        let r3 = w(a, b - 1, c)
        memo[a][b][c] = r1 + r2 - r3
        return memo[a][b][c]
    } else {
        let r1 = w(a - 1, b, c)
        let r2 = w(a - 1, b - 1, c)
        let r3 = w(a - 1, b, c - 1)
        let r4 = w(a - 1, b - 1, c - 1)
        memo[a][b][c] = r1 + r2 + r3 - r4
        return memo[a][b][c]
    }
}

while true {
    let input = readLine()!.components(separatedBy: " ").map { Int($0)! }
    let a = input[0]
    let b = input[1]
    let c = input[2]
    if a == -1, b == -1, c == -1 { break }
    let result = w(a, b, c)
    print("w(\(a), \(b), \(c)) = \(result)")
}