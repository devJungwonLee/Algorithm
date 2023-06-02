import Foundation

let input = readLine()!.split(separator: " ").map { Int($0)! }
let n = input[0]
let m = input[1]
var a = [[Int]]()
var d = [[Int]: Int]()

func findMax(_ day: Int, _ idx: Int) -> Int {
    if idx == m { return 0 }
    if d.keys.contains([day, idx]) {
        return d[[day, idx]]!
    }
    let chapter = a[idx]
    var maxValue = 0
    if day + chapter[0] <= n {
        maxValue = max(maxValue, chapter[1] + findMax(day + chapter[0], idx + 1))
    }
    maxValue = max(maxValue, findMax(day, idx + 1))
    d[[day, idx]] = maxValue
    return d[[day, idx]]!
}

for _ in 0..<m {
    let input = readLine()!.split(separator: " ").map { Int($0)! }
    a.append(input)
}

let answer = findMax(0, 0)
print(answer)