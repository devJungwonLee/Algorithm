import Foundation
let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(a[0] * a[1] + a[2] * a[3])