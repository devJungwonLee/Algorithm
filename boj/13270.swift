let n = Int(readLine()!)!
var fib = [2, 3]
var memo = [Int: [Int]]()

while let a = fib.last, a < n {
    let m = fib.count
    let b = fib[m-2]
    if a + b > n { break }
    fib.append(a + b)
}

func findMinMax(_ n: Int) -> [Int]? {
    if n < 0 { return nil }
    else if n == 2 { return [1, 1] }
    else if n == 3 { return [2, 2] }
    else if let result = memo[n] { return result }
    else {
        var i = 0
        var a = [[Int]]()
        while i < fib.count - 1, fib[i+1] <= n {
            let x = fib[i]
            let y = n - x
            if let resultX = findMinMax(x), let resultY = findMinMax(y) {
                a.append([resultX[0] + resultY[0], resultX[1] + resultY[1]])
            }
            i += 1
        }
        let minValue = a.map { $0[0] }.min()!
        let maxValue = a.map { $0[1] }.max()!
        memo[n] = [minValue, maxValue]
        return memo[n]!
    }
}

if let result = findMinMax(n) {
    print("\(result[0]) \(result[1])")
}