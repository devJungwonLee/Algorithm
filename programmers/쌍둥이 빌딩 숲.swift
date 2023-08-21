import Foundation

func solution(_ n:Int, _ count:Int) -> Int {
    let mod = 1000000007
    var d = [[Int]](repeating: [], count: n + 1)
    for i in 0...n {
        d[i] = [Int](repeating: 0, count: i + 1)
        d[i][i] = 1
    }
    if n == 1 { return d[n][count] }
    for i in 2...n {
        for j in 1..<i {
            d[i][j] = (d[i][j] + Int(Int64(d[i-1][j]) * Int64(2 * (i - 1)) % Int64(mod))) % mod
            d[i][j] = (d[i][j] + d[i-1][j-1]) % mod
        }
    }
    return d[n][count]
}