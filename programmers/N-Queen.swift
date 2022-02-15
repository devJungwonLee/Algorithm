import Foundation

var answer = 0

func dfs(_ a: [Int], _ n: Int) {
    let row = a.count
    if row == n {
        answer += 1
        return
    }
    for col in 0..<n {
        var flag = true
        for (r, c) in a.enumerated() {
            if c == col || r + c == row + col || r - c == row - col {
                flag = false
                break
            }
        }
        if flag { dfs(a + [col], n) }
    }
}

func solution(_ n:Int) -> Int {
    dfs([], n)
    return answer
}