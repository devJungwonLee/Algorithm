import Foundation

extension Array where Element == Int {
    func nujeok() -> [Element] {
        var result = [0]
        for num in self {
            result.append(result.last! + num)
        }
        return result
    }
}

let n = Int(readLine()!)!
let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
let sa = a.nujeok()
let aa = a.map { $0 * $0 }
let saa = aa.nujeok()

func criterion(_ start: Int, _ k: Int) -> Int {
    let end = start + k - 1
    let sum = sa[end+1] - sa[start]
    let sum2 = saa[end+1] - saa[start]
    return sum2 * k - sum * sum
}

for k in 1...n {
    let i = (0...n-k).max { lhs, rhs in
        criterion(lhs, k) < criterion(rhs, k)
    }!
    print(i+1)
}