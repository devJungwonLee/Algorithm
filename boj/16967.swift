import Foundation

let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
let h = s[0]
let w = s[1]
let x = s[2]
let y = s[3]
var a: [[Int]] = []
for _ in 0..<(h + x) {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    a.append(s)
}
for i in 0..<h {
    for j in 0..<w {
        if i - x >= 0, j - y >= 0 {
            print(a[i][j] - a[i-x][j-y], terminator: " ")
            a[i][j] = a[i][j] - a[i-x][j-y]
        } else {
            print(a[i][j], terminator: " ")
        }
    }
    print("")
}