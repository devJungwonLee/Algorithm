import Foundation

func dfs(_ a: [Int]) -> Int {
    var maxValue = 0
    for i in 1..<(a.count - 1) {
        var sum = a[i-1] * a[i+1]
        var b = a
        b.remove(at: i)
        sum += dfs(b)
        maxValue = max(maxValue, sum)
    }
    return maxValue
}

let n = Int(readLine()!)!
var w = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(dfs(w))