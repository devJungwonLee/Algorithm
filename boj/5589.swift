import Foundation

let s = readLine()!.split(separator: " ").map { Int($0)! }
let r = s[0]
let c = s[1]
var a = [[Bool]]()
var ans = 0

for _ in 0..<r {
    let s = readLine()!.split(separator: " ").map { $0 == "1" }
    a.append(s)
}

for k in 0..<(1<<r) {
    let b = k.booleanArray(count: r)
    var x = a
    b.indices.forEach { i in
        guard b[i] else { return }
        for j in 0..<c { x[i][j].toggle() }
    }
    var sum1 = 0
    for j in 0..<c {
        var sum2 = 0
        for i in 0..<r {
            if x[i][j] { sum2 += 1 }
        }
        sum1 += max(sum2, r - sum2)
    }
    ans = max(ans, sum1)
}

print(ans)

private extension Int {
    func booleanArray(count: Int) -> [Bool] {
        var result = [Bool]()
        var x = self
        var i = count

        while i > 0 {
            let r = x % 2
            result.append(r == 1)
            x /= 2
            i -= 1
        }
        return result
    }
}