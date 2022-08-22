import Foundation

let n = Int(readLine()!)!
for _ in 0..<n {
    let s = readLine()!
    (6...9) ~= s.count ? print("yes") : print("no")
}