import Foundation

let p = readLine()!.split(separator: " ").map { Double($0)! }
var d = [[Int: Double]](repeating: [Int: Double](), count: 21)
d[0][2000] = 1.0

for i in 0..<20 {
    for (point, current) in d[i] {
        var next = d[i + 1][point + 50] ?? 0
        d[i + 1][point + 50] = next + current * p[0]
        next = d[i + 1][point - 50] ?? 0
        d[i + 1][point - 50] = next + current * p[1]
        next = d[i + 1][point] ?? 0
        d[i + 1][point] = next + current * p[2]
    }
}

var probByTier = [Double](repeating: 0.0, count: 5)
for (point, prob) in d[20] {
    let tier = (point - 1000) / 500
    probByTier[tier] += prob
}
let answer = probByTier.map {
    return String(format: "%.8f", round($0 * pow(10, 8)) / pow(10, 8))
}
answer.forEach { print($0) }