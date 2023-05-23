import Foundation

func findMaxSum(_ a: [Int64]) -> Int64 {
    var maxValue = a.max()!
    var i = a.lastIndex(of: maxValue)!
    var minValue = Int64.max
    for j in 0...i {
        if a[j] < minValue { minValue = a[j] }
    }
    if minValue < 0 { return maxValue - minValue }
    else { return maxValue }
}

func solution(_ sequence:[Int]) -> Int64 {
    let n = sequence.count
    var a = [[Int64]](repeating: [Int64](repeating: 0, count: 2), count: n)
    for i in 0..<n {
        for j in 0..<2 {
            if i == 0 { 
                a[i][j] = Int64(sequence[i]) * Int64(pow(Double(-1), Double(i + j)))
            } else {
                a[i][j] = a[i-1][j] + Int64(sequence[i]) * Int64(pow(Double(-1), Double(i + j)))
            }
        }
    }
    let x = findMaxSum(a.map { $0[0] })
    let y = findMaxSum(a.map { $0[1] })
    return max(x, y)
}