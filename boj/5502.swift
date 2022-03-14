let n = Int(readLine()!)!
let s = readLine()!.map { String($0) }
var dp = [[Int]](repeating: [Int](repeating: -1, count: n), count: n)

func dfs(_ start: Int, _ end: Int) -> Int {
    if dp[start][end] > -1 { return dp[start][end] }
    if start >= end {
        dp[start][end] = 0
        return 0
    }
    var result = dfs(start+1, end) + 1
    result = min(result, dfs(start, end-1) + 1)
    if s[start] == s[end] {
        result = min(result, dfs(start+1, end-1))
    }
    dp[start][end] = result
    return result 
}

print(dfs(0, n-1))