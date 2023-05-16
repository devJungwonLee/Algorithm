import Foundation

func area(_ range: [Int], _ y: [Int]) -> Double {
    let start = range[0]
    let end = y.count - 1 + range[1]
    if start > end { return -1 }
    var sum: Double = 0
    for i in start..<end { sum += Double(y[i] + y[i + 1]) / 2 }
    return sum
}

func solution(_ k:Int, _ ranges:[[Int]]) -> [Double] {
    var y = [k]
    while let last = y.last, last > 1 {
        let next = last % 2 == 0 ? last / 2 : 3 * last + 1
        y.append(next)
    }
    return ranges.map { area($0, y) }
}