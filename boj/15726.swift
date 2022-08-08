import Foundation
let a = readLine()!.components(separatedBy: " ").map { Int($0)! }
print(max(a[0]*a[1]/a[2], a[0]*a[2]/a[1]))