import Foundation
let n = Int(readLine()!)!
var a = readLine()!.split(separator: " ").map { Int($0)! }
a.sort()
var answer = [Int]()
var tmp = [0, 0, 0]

for i in 0..<(n-2) {
    var minValue = Int.max
    tmp[0] = a[i]
    var left = i + 1
    var right = n - 1
    while (left < right) {
        let sum = tmp[0] + a[left] + a[right]
        if abs(sum) < minValue {
            minValue = abs(sum)
            tmp[1] = a[left]
            tmp[2] = a[right]
        }
        if sum < 0 { left += 1 }
        else { right -= 1 }
    }
    if answer.isEmpty { answer = tmp }
    else if abs(tmp.reduce(0, +)) < abs(answer.reduce(0, +)) { answer = tmp }
}
print(answer.map { String($0) }.joined(separator: " "))