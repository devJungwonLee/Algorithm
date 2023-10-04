import Foundation
let input = readLine()!.components(separatedBy: ":")
let a = input.map { Int($0)! }
let permutation = [
    [0, 1, 2], [0, 2, 1], [1, 0, 2], [1, 2, 0], [2, 0, 1], [2, 1, 0]
]
var count = 0
for p in permutation {
    let h = a[p[0]]
    let m = a[p[1]]
    let s = a[p[2]]
    if (1...12) ~= h && (0...59) ~= m && (0...59) ~= s {
        count += 1
    }
}
print(count)