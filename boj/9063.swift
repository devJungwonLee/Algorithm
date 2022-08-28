import Foundation

var x = [Int]()
var y = [Int]()

let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!.components(separatedBy: " ").map { Int($0)! }
    x.append(s[0])
    y.append(s[1])
}
print((x.max()! - x.min()!) * (y.max()! - y.min()!))